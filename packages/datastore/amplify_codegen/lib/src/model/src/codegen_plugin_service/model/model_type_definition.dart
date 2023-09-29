// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_type_definition; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_index.dart'
    as _i3;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i5;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i6;

part 'model_type_definition.g.dart';

abstract class ModelTypeDefinition
    with _i1.AWSEquatable<ModelTypeDefinition>
    implements Built<ModelTypeDefinition, ModelTypeDefinitionBuilder> {
  factory ModelTypeDefinition({
    required String name,
    required String pluralName,
    required Map<String, _i2.ModelField> fields,
    required List<_i3.ModelIndex> indexes,
    List<_i4.AuthRule>? authRules,
  }) {
    return _$ModelTypeDefinition._(
      name: name,
      pluralName: pluralName,
      fields: _i5.BuiltMap(fields),
      indexes: _i5.BuiltList(indexes),
      authRules: authRules == null ? null : _i5.BuiltList(authRules),
    );
  }

  factory ModelTypeDefinition.build(
          [void Function(ModelTypeDefinitionBuilder) updates]) =
      _$ModelTypeDefinition;

  const ModelTypeDefinition._();

  static const List<_i6.SmithySerializer<ModelTypeDefinition>> serializers = [
    ModelTypeDefinitionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelTypeDefinitionBuilder b) {}
  String get name;
  String get pluralName;
  _i5.BuiltMap<String, _i2.ModelField> get fields;
  _i5.BuiltList<_i3.ModelIndex> get indexes;
  _i5.BuiltList<_i4.AuthRule>? get authRules;
  @override
  List<Object?> get props => [
        name,
        pluralName,
        fields,
        indexes,
        authRules,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelTypeDefinition')
      ..add(
        'name',
        name,
      )
      ..add(
        'pluralName',
        pluralName,
      )
      ..add(
        'fields',
        fields,
      )
      ..add(
        'indexes',
        indexes,
      )
      ..add(
        'authRules',
        authRules,
      );
    return helper.toString();
  }
}

class ModelTypeDefinitionRestJson1Serializer
    extends _i6.StructuredSmithySerializer<ModelTypeDefinition> {
  const ModelTypeDefinitionRestJson1Serializer() : super('ModelTypeDefinition');

  @override
  Iterable<Type> get types => const [
        ModelTypeDefinition,
        _$ModelTypeDefinition,
      ];
  @override
  Iterable<_i6.ShapeId> get supportedProtocols => const [
        _i6.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelTypeDefinition deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelTypeDefinitionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'authRules':
          result.authRules.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(_i4.AuthRule)],
            ),
          ) as _i5.BuiltList<_i4.AuthRule>));
        case 'fields':
          result.fields.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltMap,
              [
                FullType(String),
                FullType(_i2.ModelField),
              ],
            ),
          ) as _i5.BuiltMap<String, _i2.ModelField>));
        case 'indexes':
          result.indexes.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(_i3.ModelIndex)],
            ),
          ) as _i5.BuiltList<_i3.ModelIndex>));
        case 'name':
          result.name = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'pluralName':
          result.pluralName = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelTypeDefinition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ModelTypeDefinition(
      :authRules,
      :fields,
      :indexes,
      :name,
      :pluralName
    ) = object;
    result$.addAll([
      'fields',
      serializers.serialize(
        fields,
        specifiedType: const FullType(
          _i5.BuiltMap,
          [
            FullType(String),
            FullType(_i2.ModelField),
          ],
        ),
      ),
      'indexes',
      serializers.serialize(
        indexes,
        specifiedType: const FullType(
          _i5.BuiltList,
          [FullType(_i3.ModelIndex)],
        ),
      ),
      'name',
      serializers.serialize(
        name,
        specifiedType: const FullType(String),
      ),
      'pluralName',
      serializers.serialize(
        pluralName,
        specifiedType: const FullType(String),
      ),
    ]);
    if (authRules != null) {
      result$
        ..add('authRules')
        ..add(serializers.serialize(
          authRules,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(_i4.AuthRule)],
          ),
        ));
    }
    return result$;
  }
}
