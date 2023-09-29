// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.schema_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/app_sync_scalar.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/enum_type.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/list_type.dart'
    as _i7;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/non_model_type.dart'
    as _i6;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/scalar_type.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

/// A reference to an Amplify schema type. An Amplify schema type is either a scalar, model, non-model, enum, or a collection of one of these.
sealed class SchemaType extends _i1.SmithyUnion<SchemaType> {
  const SchemaType._();

  factory SchemaType.scalar({
    bool? isRequired,
    required _i2.AppSyncScalar scalar,
  }) =>
      SchemaTypeScalar(_i3.ScalarType(
        isRequired: isRequired,
        scalar: scalar,
      ));

  factory SchemaType.enum$({
    bool? isRequired,
    required String enum_,
  }) =>
      SchemaTypeEnum(_i4.EnumType(
        isRequired: isRequired,
        enum_: enum_,
      ));

  factory SchemaType.model({
    bool? isRequired,
    required String model,
  }) =>
      SchemaTypeModel(_i5.ModelType(
        isRequired: isRequired,
        model: model,
      ));

  factory SchemaType.nonModel({
    bool? isRequired,
    required String nonModel,
  }) =>
      SchemaTypeNonModel(_i6.NonModelType(
        isRequired: isRequired,
        nonModel: nonModel,
      ));

  factory SchemaType.list({
    bool? isRequired,
    required SchemaType ofType,
  }) =>
      SchemaTypeList(_i7.ListType(
        isRequired: isRequired,
        ofType: ofType,
      ));

  const factory SchemaType.sdkUnknown(
    String name,
    Object value,
  ) = SchemaTypeSdkUnknown;

  static const List<_i1.SmithySerializer<SchemaType>> serializers = [
    SchemaTypeRestJson1Serializer()
  ];

  /// A scalar (primitive) type, e.g. \`ID\`, \`String\`, \`AWSDateTime\`. AppSync defines 9 \[scalar types\](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html) on top of the default 5 GraphQL scalar types (\`ID\`, \`String\`, \`Int\`, \`Float\`, \`Boolean\`): - \`AWSDate\` - \`AWSTime\` - \`AWSDateTime\` - \`AWSTimestamp\` - \`AWSEmail\` - \`AWSJSON\` - \`AWSURL\` - \`AWSPhone\` - \`AWSIPAddress\`
  _i3.ScalarType? get scalar => null;

  /// A custom enumeration. \`\`\`graphql # \`MyEnum` is an enum type. enum MyEnum { VALUE1 VALUE2 } ```
  _i4.EnumType? get enum$ => null;

  /// A custom structure with an `@model` directive. \`\`\`graphql # \`MyModel` is a model type. type MyModel @model { id: ID! } ```
  _i5.ModelType? get model => null;

  /// A custom structure without an `@model` directive. \`\`\`graphql # \`MyNonModel` is a non-model type. type MyNonModel { name: String! } ```
  _i6.NonModelType? get nonModel => null;

  /// A list of another \[SchemaType\]. \`\`\`graphql type MyNonModel { name: String! } # \`nonModels` is a list type of \`MyNonModel\` types type MyModel @model { id: ID! nonModels: \[MyNonModel\] } ```
  _i7.ListType? get list => null;
  @override
  Object get value => (scalar ?? enum$ ?? model ?? nonModel ?? list)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'SchemaType');
    if (scalar != null) {
      helper.add(
        r'scalar',
        scalar,
      );
    }
    if (enum$ != null) {
      helper.add(
        r'enum$',
        enum$,
      );
    }
    if (model != null) {
      helper.add(
        r'model',
        model,
      );
    }
    if (nonModel != null) {
      helper.add(
        r'nonModel',
        nonModel,
      );
    }
    if (list != null) {
      helper.add(
        r'list',
        list,
      );
    }
    return helper.toString();
  }
}

final class SchemaTypeScalar extends SchemaType {
  const SchemaTypeScalar(this.scalar) : super._();

  @override
  final _i3.ScalarType scalar;

  @override
  String get name => 'scalar';
}

final class SchemaTypeEnum extends SchemaType {
  const SchemaTypeEnum(this.enum$) : super._();

  @override
  final _i4.EnumType enum$;

  @override
  String get name => 'enum';
}

final class SchemaTypeModel extends SchemaType {
  const SchemaTypeModel(this.model) : super._();

  @override
  final _i5.ModelType model;

  @override
  String get name => 'model';
}

final class SchemaTypeNonModel extends SchemaType {
  const SchemaTypeNonModel(this.nonModel) : super._();

  @override
  final _i6.NonModelType nonModel;

  @override
  String get name => 'nonModel';
}

final class SchemaTypeList extends SchemaType {
  const SchemaTypeList(this.list) : super._();

  @override
  final _i7.ListType list;

  @override
  String get name => 'list';
}

final class SchemaTypeSdkUnknown extends SchemaType {
  const SchemaTypeSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class SchemaTypeRestJson1Serializer
    extends _i1.StructuredSmithySerializer<SchemaType> {
  const SchemaTypeRestJson1Serializer() : super('SchemaType');

  @override
  Iterable<Type> get types => const [
        SchemaType,
        SchemaTypeScalar,
        SchemaTypeEnum,
        SchemaTypeModel,
        SchemaTypeNonModel,
        SchemaTypeList,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  SchemaType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'scalar':
        return SchemaTypeScalar((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.ScalarType),
        ) as _i3.ScalarType));
      case 'enum':
        return SchemaTypeEnum((serializers.deserialize(
          value,
          specifiedType: const FullType(_i4.EnumType),
        ) as _i4.EnumType));
      case 'model':
        return SchemaTypeModel((serializers.deserialize(
          value,
          specifiedType: const FullType(_i5.ModelType),
        ) as _i5.ModelType));
      case 'nonModel':
        return SchemaTypeNonModel((serializers.deserialize(
          value,
          specifiedType: const FullType(_i6.NonModelType),
        ) as _i6.NonModelType));
      case 'list':
        return SchemaTypeList((serializers.deserialize(
          value,
          specifiedType: const FullType(_i7.ListType),
        ) as _i7.ListType));
    }
    return SchemaType.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SchemaType object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        SchemaTypeScalar(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i3.ScalarType),
          ),
        SchemaTypeEnum(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i4.EnumType),
          ),
        SchemaTypeModel(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i5.ModelType),
          ),
        SchemaTypeNonModel(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i6.NonModelType),
          ),
        SchemaTypeList(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i7.ListType),
          ),
        SchemaTypeSdkUnknown(:final value) => value,
      },
    ];
  }
}
