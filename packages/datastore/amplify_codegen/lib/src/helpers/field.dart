// Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:amplify_codegen/src/generator/context.dart';
import 'package:amplify_codegen/src/generator/types.dart';
import 'package:amplify_codegen/src/generator/visitors.dart';
import 'package:amplify_codegen/src/helpers/language.dart';
import 'package:amplify_codegen/src/helpers/model.dart';
import 'package:amplify_codegen/src/helpers/node.dart';
import 'package:amplify_codegen/src/helpers/types.dart';
// ignore: implementation_imports
import 'package:amplify_core/src/types/models/mipr.dart';
// ignore: implementation_imports
import 'package:amplify_core/src/types/query/query_field.dart';
import 'package:aws_common/aws_common.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:gql/ast.dart';
// ignore: implementation_imports
import 'package:smithy_codegen/src/util/symbol_ext.dart';

/// Returns the query field name for [fieldName].
String queryFieldName(String fieldName) => ('$fieldName\$').camelCase;

class _FromJsonVisitor extends SchemaTypeVisitor<Expression> {
  _FromJsonVisitor(
    this._jsonRef, {
    required this.modelName,
    required this.field,
    required this.orElse,
    this.hierarchyType,
  });

  final String modelName;
  final ModelField field;
  final Expression Function() orElse;
  final ModelHierarchyType? hierarchyType;
  Expression _jsonRef;
  var _depth = -1;

  Expression _visitWithRef(SchemaType type, Expression jsonRef) {
    final saved = _jsonRef;
    _jsonRef = jsonRef;
    final visited = visit(type);
    _jsonRef = saved;
    return visited;
  }

  @override
  Expression visit(SchemaType type) {
    _depth++;
    final visited = super.visit(type);
    _depth--;
    return visited;
  }

  Expression _deserialize({
    required SchemaType type,
    Reference? asA,
    Expression Function(Expression)? constructor,
    Expression Function()? defaultValue,
  }) {
    final val = _depth == 0 && asA != null ? _jsonRef.asA(asA) : _jsonRef;
    final exp = constructor == null ? val : constructor(val);
    final isRequired = type.isRequired;
    return _depth == 0 || constructor != null
        ? _jsonRef.equalTo(literalNull).conditional(
              defaultValue?.call() ?? (isRequired ? orElse() : literalNull),
              exp,
            )
        : (isRequired
            ? _jsonRef.ifNullThen(defaultValue?.call() ?? orElse())
            : _jsonRef);
  }

  @override
  Expression visitEnumType(EnumType type) {
    return _deserialize(
      type: type,
      asA: DartTypes.core.string,
      constructor: (val) =>
          type.reference.nonNull.property('fromJson').call([val]),
    );
  }

  @override
  Expression visitListType(ListType type) {
    final val = _jsonRef.asA(
      DartTypes.core.list(
        DartTypes.core.object.nullable,
      ),
    );
    final elementType = type.elementType;
    final isPrimitive = elementType.isPrimitive;
    var exp =
        val.property('cast').call([], {}, [elementType.wireType.nullable]);
    if (!isPrimitive || elementType.isRequired) {
      exp = exp.property('map').call([
        Method(
          (m) => m
            ..lambda = true
            ..requiredParameters.add(Parameter((p) => p..name = 'el'))
            ..body = _visitWithRef(elementType, refer('el')).code,
        ).closure,
      ]);
    }
    if (elementType is ModelType) {
      final relatedModel = context.modelNamed(elementType.name);
      final relatedModelTypes = relatedModel.references;
      final thisHierarchyType = relatedModelTypes.hierarchyType(hierarchyType!);
      exp = DartTypes.amplifyCore
          .asyncModelCollection(
            relatedModelTypes.modelIdentifier,
            relatedModelTypes.model,
            relatedModelTypes.partialModel,
            thisHierarchyType,
          )
          .property('fromList')
          .call([
        if (elementType.isRequired)
          exp.property('toList').call([])
        else
          exp
              .property('whereType')
              .call([], {}, [thisHierarchyType])
              .property('toList')
              .call([]),
      ]);
    } else {
      exp = exp.property('toList').call([]);
    }
    return _jsonRef
        .equalTo(literalNull)
        .conditional(type.isRequired ? orElse() : literalNull, exp);
  }

  @override
  Expression visitModelType(ModelType type) {
    final relatedModel = context.modelNamed(type.name);
    final relatedModelTypes = relatedModel.references;
    Expression modelFromJson(Expression val) => relatedModelTypes.model.nonNull
            .property('classType')
            .property('fromJson')
            .call([
          val
        ], {}, [
          relatedModel.references.hierarchyType(hierarchyType!),
        ]);
    if (_depth > 0 ||
        // belongsTo do not use AsyncModel
        field.association!.associationType == ModelAssociationType.belongsTo) {
      return _deserialize(
        type: type,
        asA: _depth > 0 ? null : DartTypes.core.json,
        constructor: modelFromJson,
      );
    }
    final asyncModelType = DartTypes.amplifyCore.asyncModel(
      relatedModelTypes.modelIdentifier,
      relatedModelTypes.model,
      relatedModelTypes.partialModel,
      relatedModelTypes.hierarchyType(hierarchyType!),
    );
    final targetNames = field.association!.targetNames;
    Expression Function()? defaultValue;
    // For `hasOne` types, construct an AsyncModel from the target fields if
    // just those are present.
    if (targetNames != null) {
      final thisModel = context.modelNamed(modelName);
      final targetFields = targetNames
          .map((name) => thisModel.fieldNamed(name).dartName)
          .toList();
      var exp = refer(targetFields.first).equalTo(literalNull);
      for (var i = 1; i < targetFields.length; i++) {
        exp = exp.or(
          refer(targetFields[i]).equalTo(literalNull),
        );
      }
      final relatedModelFields = relatedModel.modelIdentifier.fields
          .map((name) => relatedModel.fieldNamed(name).dartName)
          .toList();
      final modelIdentifier = targetFields.length == 1
          ? refer(targetFields.single)
          : relatedModel.references.modelIdentifier.newInstance(
              [],
              {
                for (var i = 0; i < relatedModelFields.length; i++)
                  relatedModelFields[i]: refer(targetFields[i]),
              },
            );
      defaultValue = () => exp.conditional(
            field.type.isRequired ? orElse() : literalNull,
            asyncModelType.newInstanceNamed('fromModelIdentifier', [
              relatedModel.references.model.property('classType'),
              modelIdentifier,
            ]),
          );
    }
    return _deserialize(
      type: type,
      asA: DartTypes.core.json,
      defaultValue: defaultValue,
      constructor: (val) =>
          asyncModelType.newInstanceNamed('fromModel', [modelFromJson(val)]),
    );
  }

  @override
  Expression visitNonModelType(NonModelType type) {
    return _deserialize(
      type: type,
      asA: DartTypes.core.json,
      constructor: (val) =>
          type.reference.nonNull.property('fromJson').call([val]),
    );
  }

  @override
  Expression visitScalar(ScalarType type) {
    Expression? constructor;
    switch (type.value) {
      case AppSyncScalar.awsDate:
      case AppSyncScalar.awsDateTime:
      case AppSyncScalar.awsTime:
        constructor = type.reference.nonNull.property('fromString');
        break;
      case AppSyncScalar.awsTimestamp:
        constructor = type.reference.nonNull.property('fromSeconds');
        break;
      case AppSyncScalar.awsUrl:
        constructor = type.reference.nonNull.property('parse');
        break;
      case AppSyncScalar.awsJson:
        if (!type.isRequired) {
          // Already an `Object?` coming off the JSON map.
          return _jsonRef;
        }
        break;
      case AppSyncScalar.awsEmail:
      case AppSyncScalar.awsIpAddress:
      case AppSyncScalar.awsPhone:
      case AppSyncScalar.boolean:
      case AppSyncScalar.float:
      case AppSyncScalar.id:
      case AppSyncScalar.int_:
      case AppSyncScalar.string:
        break;
    }
    Expression Function()? defaultValue;
    // `_deleted` is nullable in the schema but if not present, we know it's
    // `false`.
    if (field.name == '_deleted') {
      defaultValue = () => literalFalse;
    }
    return _deserialize(
      type: type,
      asA: type.wireType.nonNull,
      defaultValue: defaultValue,
      constructor:
          constructor == null ? null : (val) => constructor!.call([val]),
    );
  }
}

class _ToJsonVisitor extends SchemaTypeVisitor<Expression> {
  _ToJsonVisitor(this._fieldRef);

  Expression _fieldRef;

  Expression _visitWithRef(SchemaType type, Expression fieldRef) {
    final saved = _fieldRef;
    _fieldRef = fieldRef;
    final visited = visit(type);
    _fieldRef = saved;
    return visited;
  }

  @override
  Expression visitEnumType(EnumType type) {
    final isNullable = !type.isRequired;
    return _fieldRef.nullableProperty('value', isNullable);
  }

  @override
  Expression visitListType(ListType type) {
    final isNullable = !type.isRequired;
    final elementType = type.elementType;
    if (elementType is ModelType) {
      return _fieldRef.nullableProperty('toJson', isNullable).call([]);
    }
    return elementType.isPrimitive
        ? _fieldRef
        : _fieldRef
            .nullableProperty('map', isNullable)
            .call([
              Method(
                (m) => m
                  ..lambda = true
                  ..requiredParameters.add(Parameter((p) => p..name = 'el'))
                  ..body = _visitWithRef(elementType, refer('el')).code,
              ).closure
            ])
            .property('toList')
            .call([]);
  }

  @override
  Expression visitModelType(ModelType type) {
    final isNullable = !type.isRequired;
    return _fieldRef.nullableProperty('toJson', isNullable).call([]);
  }

  @override
  Expression visitNonModelType(NonModelType type) {
    final isNullable = !type.isRequired;
    return _fieldRef.nullableProperty('toJson', isNullable).call([]);
  }

  @override
  Expression visitScalar(ScalarType type) {
    final isNullable = !type.isRequired;
    switch (type.value) {
      case AppSyncScalar.awsDate:
      case AppSyncScalar.awsDateTime:
      case AppSyncScalar.awsTime:
        return _fieldRef.nullableProperty('format', isNullable).call([]);
      case AppSyncScalar.awsTimestamp:
        return _fieldRef.nullableProperty('toSeconds', isNullable).call([]);
      case AppSyncScalar.awsUrl:
        return _fieldRef.nullableProperty('toString', isNullable).call([]);
      case AppSyncScalar.awsJson:
      case AppSyncScalar.awsIpAddress:
      case AppSyncScalar.awsEmail:
      case AppSyncScalar.awsPhone:
      case AppSyncScalar.boolean:
      case AppSyncScalar.float:
      case AppSyncScalar.id:
      case AppSyncScalar.int_:
      case AppSyncScalar.string:
        break;
    }
    return _fieldRef;
  }
}

/// Helpers for [ModelField].
extension ModelFieldHelpers on ModelField {
  /// The wire name as it shows in JSON.
  String get wireName => name;

  /// The re-cased Dart name (camelCase).
  String get dartName {
    final name = this.name.camelCase;
    if (hardReservedWords.contains(name)) {
      return '${name}_';
    }
    return name;
  }

  /// Returns the [ModelHierarchyType] for the associated model, if any, for
  /// this model's current hiearchy type.
  ///
  /// For example, for the Blog/Post/Comment model:
  ///
  /// ```
  /// PartialBlog                 PartialPost                 PartialComment
  /// -----------                 -----------                 --------------
  /// posts: [PartialPost]        blog: PartialBlog           post: PartialPost
  ///                             comments: [PartialComment]
  ///
  /// Blog                        Post                        Comment
  /// ----                        ----                        -------
  /// posts: [Post]               blog: Blog                  post: Post
  ///                             comments: [Comment]
  ///
  /// RemoteBlog                  RemotePost                  RemoteComment
  /// ----------                  ----------                  -------------
  /// posts: [Post]               blog: RemoteBlog            post: RemotePost
  ///                             comments: [Comment]
  /// ```
  ModelHierarchyType? associationHiearchyType(
    ModelHierarchyType hierarchyType,
  ) {
    final association = this.association;
    if (association == null) {
      return null;
    }
    switch (hierarchyType) {
      case ModelHierarchyType.partial:
        return ModelHierarchyType.partial;
      case ModelHierarchyType.model:
        return ModelHierarchyType.model;
      case ModelHierarchyType.remote:
        switch (association.associationType) {
          // Since the foreign keys for these types are local to the model,
          // they must be synced after their parent models. Thus, if they have
          // been remotely synced, we can guarantee their parents have been
          // already.
          case ModelAssociationType.belongsTo:
          case ModelAssociationType.manyToMany:
            return ModelHierarchyType.remote;
          case ModelAssociationType.hasMany:
          case ModelAssociationType.hasOne:
            return ModelHierarchyType.model;
        }
    }
    throw ArgumentError(
      'Invalid association/hiearchy type: $association/$hierarchyType',
    );
  }

  /// A builder for converting to this field's type from a primitive value.
  Expression Function(Expression)? get fromPrimitive {
    final type = this.type;
    Expression Function(Expression)? builder;
    if (type is ScalarType) {
      switch (type.value) {
        case AppSyncScalar.awsDate:
          builder =
              (ref) => DartTypes.amplifyCore.temporalDate.newInstance([ref]);
          break;
        case AppSyncScalar.awsDateTime:
          builder = (ref) =>
              DartTypes.amplifyCore.temporalDateTime.newInstance([ref]);
          break;
        case AppSyncScalar.awsTime:
          builder =
              (ref) => DartTypes.amplifyCore.temporalTime.newInstance([ref]);
          break;
        case AppSyncScalar.awsTimestamp:
          builder = (ref) =>
              DartTypes.amplifyCore.temporalTimestamp.newInstance([ref]);
          break;
        case AppSyncScalar.id:
        case AppSyncScalar.awsIpAddress:
        case AppSyncScalar.awsEmail:
        case AppSyncScalar.awsJson:
        case AppSyncScalar.awsPhone:
        case AppSyncScalar.awsUrl:
        case AppSyncScalar.boolean:
        case AppSyncScalar.float:
        case AppSyncScalar.int_:
        case AppSyncScalar.string:
          break;
      }
    } else if (type is ModelType) {
      switch (association!.associationType) {
        case ModelAssociationType.belongsTo:
          break;
        case ModelAssociationType.hasMany:
        case ModelAssociationType.hasOne:
        case ModelAssociationType.manyToMany:
          builder = (ref) => DartTypes.amplifyCore
              .asyncModel()
              .newInstanceNamed('fromModel', [ref]);
          break;
      }
    } else if (type is ListType && type.elementType is ModelType) {
      builder = (ref) => DartTypes.amplifyCore
          .asyncModelCollection()
          .newInstanceNamed('fromList', [ref]);
    }
    return builder;
  }

  /// The Model type factory initializer for `this`.
  Code? factoryInitializer({required bool isPrimaryKey}) {
    final type = this.type;
    var isRequired = type.isRequired;
    var builder = fromPrimitive;
    Expression? defaultValue;
    if (type is ScalarType) {
      switch (type.value) {
        case AppSyncScalar.awsDateTime:
          if (isReadOnly) {
            defaultValue =
                DartTypes.amplifyCore.temporalDateTime.property('now').call([]);
            builder = null;
          }
          break;
        case AppSyncScalar.id:
          // Allow nullable `id` parameters to the main constructor since these
          // fields can be auto-generated.
          //
          // The spec says only fields named "id" qualify for this
          // auto-generation.
          //
          // Section "Identifier Generation":
          // https://quip-amazon.com/Kx24A6l5CfuB/DataStore-correctness-specification-work#temp:C:JCV16d7c578c6ad4faf8bed29dcf
          if (isPrimaryKey && name == 'id') {
            isRequired = false;
            defaultValue = DartTypes.awsCommon.uuid.call([]);
          }
          break;
        case AppSyncScalar.awsDate:
        case AppSyncScalar.awsTime:
        case AppSyncScalar.awsTimestamp:
        case AppSyncScalar.awsIpAddress:
        case AppSyncScalar.awsEmail:
        case AppSyncScalar.awsJson:
        case AppSyncScalar.awsPhone:
        case AppSyncScalar.awsUrl:
        case AppSyncScalar.boolean:
        case AppSyncScalar.float:
        case AppSyncScalar.int_:
        case AppSyncScalar.string:
          break;
      }
    }

    if (builder == null && defaultValue == null) {
      return null;
    }
    final field = refer(dartName);
    if (defaultValue != null) {
      final Expression assignment;
      if (isReadOnly) {
        assignment = defaultValue;
      } else if (isRequired) {
        assignment = field;
      } else {
        assignment = field.ifNullThen(defaultValue);
      }
      return field.assign(assignment).code;
    }
    final assignment = isRequired
        ? builder!(field)
        : field.equalTo(literalNull).conditional(literalNull, builder!(field));
    return field.assign(assignment).code;
  }

  /// The code_builder reference for `this` for use in the model factory.
  ///
  /// These types aim to ease the use of nested types when constructing model
  /// instances. AWS time types are also replaced with [DateTime].
  Reference factoryType([ModelHierarchyType? hierarchyType]) {
    final type = this.type;
    if (type is ListType) {
      final elementType = type.elementType;
      final Reference elementRef;
      if (elementType is ModelType) {
        final model = context.modelNamed(elementType.name);
        elementRef = model.references.hierarchyType(
          associationHiearchyType(hierarchyType!)!,
        );
      } else {
        elementRef = elementType.reference;
      }
      return DartTypes.core.list(elementRef).withRequired(type.isRequired);
    }
    if (type is ScalarType) {
      var factoryType = type.reference;
      switch (type.value) {
        case AppSyncScalar.awsDate:
        case AppSyncScalar.awsDateTime:
        case AppSyncScalar.awsTime:
        case AppSyncScalar.awsTimestamp:
          factoryType = DartTypes.core.dateTime;
          break;
        case AppSyncScalar.awsEmail:
        case AppSyncScalar.awsIpAddress:
        case AppSyncScalar.awsJson:
        case AppSyncScalar.awsPhone:
        case AppSyncScalar.awsUrl:
        case AppSyncScalar.boolean:
        case AppSyncScalar.float:
        case AppSyncScalar.id:
        case AppSyncScalar.int_:
        case AppSyncScalar.string:
          break;
      }
      return factoryType.withRequired(type.isRequired);
    }
    if (type is EnumType) {
      return type.reference;
    }
    if (type is NonModelType) {
      return type.reference;
    }
    type as ModelType;
    final model = context.modelNamed(type.name);
    return model.references
        .hierarchyType(associationHiearchyType(hierarchyType!)!)
        .withRequired(type.isRequired);
  }

  /// The code_builder reference for `this`.
  Reference typeReference([ModelHierarchyType? hierarchyType]) {
    final type = this.type;
    if (type is ListType) {
      final elementType = type.elementType;
      if (elementType is ModelType) {
        final model = context.modelNamed(elementType.name);
        return DartTypes.amplifyCore
            .asyncModelCollection(
              model.references.modelIdentifier,
              model.references.model,
              model.references.partialModel,
              model.references.hierarchyType(
                associationHiearchyType(hierarchyType!)!,
              ),
            )
            .withRequired(type.isRequired);
      }
      final ref = elementType.reference;
      return DartTypes.core.list(ref).withRequired(type.isRequired);
    }
    if (type is ScalarType) {
      return type.reference;
    }
    if (type is EnumType) {
      return type.reference;
    }
    if (type is NonModelType) {
      return type.reference;
    }
    type as ModelType;
    final model = context.modelNamed(type.name);
    switch (association!.associationType) {
      case ModelAssociationType.belongsTo:
        return model.references
            .hierarchyType(
              associationHiearchyType(hierarchyType!)!,
            )
            .withRequired(type.isRequired);
      case ModelAssociationType.hasMany:
      case ModelAssociationType.hasOne:
      case ModelAssociationType.manyToMany:
        break;
    }
    return DartTypes.amplifyCore
        .asyncModel(
          model.references.modelIdentifier,
          model.references.model,
          model.references.partialModel,
          model.references.hierarchyType(
            associationHiearchyType(hierarchyType!)!,
          ),
        )
        .withRequired(type.isRequired);
  }

  /// Returns the expression needed to decode the Dart type from [jsonRef].
  Expression fromJsonExp(
    Expression jsonRef, {
    required String modelName,
    required Expression Function() orElse,
    ModelHierarchyType? hierarchyType,
  }) {
    return _FromJsonVisitor(
      jsonRef,
      modelName: modelName,
      field: this,
      orElse: orElse,
      hierarchyType: hierarchyType,
    ).visit(type);
  }

  /// Returns the expression needed to encode `this` to JSON.
  Expression toJsonExp(Expression fieldRef) {
    return _ToJsonVisitor(fieldRef).visit(type);
  }

  /// Whether the field has a corresponding [QueryField].
  bool get hasQueryField {
    final fieldType = type;
    final baseType = fieldType is ListType ? fieldType.elementType : fieldType;
    return baseType is ScalarType ||
        baseType is EnumType ||
        baseType is ModelType;
  }
}

/// Helpers for [ArgumentNode].
extension ArgumentHelpers on ArgumentNode {
  /// Returns the argument's value as a string.
  String get stringValue => (value as StringValueNode).value;

  /// Returns the argument's value as a list of strings.
  List<String> get stringListValue => (value as ListValueNode)
      .values
      .cast<StringValueNode>()
      .map((el) => el.value)
      .toList();
}

/// Helpers for [DirectiveNode].
extension DirectiveHelpers on DirectiveNode {
  /// Whether the argument named [argumentName] is defined.
  bool hasArgument(String argumentName) =>
      arguments.any((arg) => arg.name.value == argumentName);

  /// Gets the argument named [argumentName], if present.
  ArgumentNode? argumentNamed(String argumentName) =>
      arguments.firstWhereOrNull((arg) => arg.name.value == argumentName);
}

/// Helpers for [FieldDefinitionNode].
extension FieldHelpers on FieldDefinitionNode {
  /// Whether this field has a directive named [directiveName].
  bool hasDirective(String directiveName) =>
      directives.any((directive) => directive.name.value == directiveName);

  /// Locates the directive named [directiveName], if present.
  DirectiveNode? directiveNamed(String directiveName) => directives
      .firstWhereOrNull((directive) => directive.name.value == directiveName);

  /// Whether this field has a foreign relationship.
  bool get hasRelationship =>
      hasDirective('hasOne') ||
      hasDirective('belongsTo') ||
      hasDirective('hasMany') ||
      hasDirective('manyToMany');

  /// The foreign relationship directive, if any.
  DirectiveNode? get relationshipDirective {
    if (!hasRelationship) {
      return null;
    }
    return directives.singleWhere(
      (directive) =>
          directive.name.value == 'hasOne' ||
          directive.name.value == 'belongsTo' ||
          directive.name.value == 'hasMany' ||
          directive.name.value == 'manyToMany',
    );
  }

  /// The name of the connection, if any.
  String? get connectionName {
    if (!hasRelationship) {
      return null;
    }
    return directiveNamed('index')?.argumentNamed('name')?.stringValue;
  }

  /// The name of the connection's `indexName` property, if any.
  String? get indexName {
    if (!hasRelationship) {
      return null;
    }
    return relationshipDirective?.argumentNamed('indexName')?.stringValue;
  }

  /// The value of the connection `fields` property, if any.
  List<String>? get connectionFields {
    if (!hasRelationship) {
      return null;
    }
    return relationshipDirective!.argumentNamed('fields')?.stringListValue;
  }

  /// Whether this field represents a `hasMany` relationship.
  bool get isHasMany => hasDirective('hasMany');

  /// Whether this field represents a `hasOne` relationship.
  bool get isHasOne => hasDirective('hasOne');

  /// Whether this field represents a `belongsTo` relationship.
  bool get isBelongsTo => hasDirective('belongsTo');

  /// Whether this field represents a `manyToMany` relationship.
  bool get isManyToMany => hasDirective('manyToMany');

  /// The re-cased Dart name (camelCase).
  String get dartName => name.value.camelCase;

  /// The wire name as it shows in JSON.
  String get wireName => name.value;
}

/// Helpers for [DirectiveNode]s.
extension AuthRules on List<DirectiveNode> {
  /// The `@auth` directive, if any.
  DirectiveNode? get authRuleDirective {
    return firstWhereOrNull((node) => node.name.value == 'auth');
  }

  /// The `@auth` rules.
  ///
  /// Will be empty if [authRuleDirective] is `null`.
  Iterable<AuthRule> get authRules sync* {
    final directive = authRuleDirective;
    if (directive == null) {
      return;
    }
    final rulesArg = directive.arguments.single.value as ListValueNode;
    final ruleValues = rulesArg.values.cast<ObjectValueNode>();
    for (final ruleValue in ruleValues) {
      final rule = AuthRuleBuilder();
      for (final field in ruleValue.fields) {
        final node = field.value;
        switch (field.name.value) {
          case 'allow':
            rule.authStrategy = AuthStrategy.valueOf(node.stringValue);
            break;
          case 'provider':
            rule.provider = AuthRuleProvider.valueOf(node.stringValue);
            break;
          case 'ownerField':
            rule.ownerField = node.stringValue;
            break;
          case 'identityClaim':
            rule.identityClaim = node.stringValue;
            break;
          case 'groupClaim':
            rule.groupClaim = node.stringValue;
            break;
          case 'groups':
            rule.groups.addAll(node.stringListValue);
            break;
          case 'groupsField':
            rule.groupsField = node.stringValue;
            break;
          // Needed to support legacy cases:
          // https://github.com/aws-amplify/amplify-codegen/blob/0cdc52777c3e69f2968e72e7534d40645c72e7e5/packages/appsync-modelgen-plugin/src/__tests__/visitors/appsync-dart-visitor.test.ts#L199
          case 'operation':
          case 'operations':
            rule.operations
                .addAll(node.stringListValue.map(ModelOperation.valueOf));
            break;
          default:
            throw StateError('Unknown key: ${field.name.value}');
        }
      }
      yield rule.build();
    }
  }
}
