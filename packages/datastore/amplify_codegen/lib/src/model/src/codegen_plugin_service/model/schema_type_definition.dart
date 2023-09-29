// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.schema_type_definition; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/enum_type_definition.dart'
    as _i7;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_index.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type_definition.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/non_model_type_definition.dart'
    as _i6;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class SchemaTypeDefinition
    extends _i1.SmithyUnion<SchemaTypeDefinition> {
  const SchemaTypeDefinition._();

  factory SchemaTypeDefinition.model({
    required String name,
    required String pluralName,
    required Map<String, _i2.ModelField> fields,
    required List<_i3.ModelIndex> indexes,
    List<_i4.AuthRule>? authRules,
  }) =>
      SchemaTypeDefinitionModel(_i5.ModelTypeDefinition(
        name: name,
        pluralName: pluralName,
        fields: fields,
        indexes: indexes,
        authRules: authRules,
      ));

  factory SchemaTypeDefinition.nonModel({
    required String name,
    required Map<String, _i2.ModelField> fields,
  }) =>
      SchemaTypeDefinitionNonModel(_i6.NonModelTypeDefinition(
        name: name,
        fields: fields,
      ));

  factory SchemaTypeDefinition.enum$({
    required String name,
    required List<String> values,
  }) =>
      SchemaTypeDefinitionEnum(_i7.EnumTypeDefinition(
        name: name,
        values: values,
      ));

  const factory SchemaTypeDefinition.sdkUnknown(
    String name,
    Object value,
  ) = SchemaTypeDefinitionSdkUnknown;

  static const List<_i1.SmithySerializer<SchemaTypeDefinition>> serializers = [
    SchemaTypeDefinitionRestJson1Serializer()
  ];

  _i5.ModelTypeDefinition? get model => null;
  _i6.NonModelTypeDefinition? get nonModel => null;
  _i7.EnumTypeDefinition? get enum$ => null;
  @override
  Object get value => (model ?? nonModel ?? enum$)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'SchemaTypeDefinition');
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
    if (enum$ != null) {
      helper.add(
        r'enum$',
        enum$,
      );
    }
    return helper.toString();
  }
}

final class SchemaTypeDefinitionModel extends SchemaTypeDefinition {
  const SchemaTypeDefinitionModel(this.model) : super._();

  @override
  final _i5.ModelTypeDefinition model;

  @override
  String get name => 'model';
}

final class SchemaTypeDefinitionNonModel extends SchemaTypeDefinition {
  const SchemaTypeDefinitionNonModel(this.nonModel) : super._();

  @override
  final _i6.NonModelTypeDefinition nonModel;

  @override
  String get name => 'nonModel';
}

final class SchemaTypeDefinitionEnum extends SchemaTypeDefinition {
  const SchemaTypeDefinitionEnum(this.enum$) : super._();

  @override
  final _i7.EnumTypeDefinition enum$;

  @override
  String get name => 'enum';
}

final class SchemaTypeDefinitionSdkUnknown extends SchemaTypeDefinition {
  const SchemaTypeDefinitionSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class SchemaTypeDefinitionRestJson1Serializer
    extends _i1.StructuredSmithySerializer<SchemaTypeDefinition> {
  const SchemaTypeDefinitionRestJson1Serializer()
      : super('SchemaTypeDefinition');

  @override
  Iterable<Type> get types => const [
        SchemaTypeDefinition,
        SchemaTypeDefinitionModel,
        SchemaTypeDefinitionNonModel,
        SchemaTypeDefinitionEnum,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  SchemaTypeDefinition deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'model':
        return SchemaTypeDefinitionModel((serializers.deserialize(
          value,
          specifiedType: const FullType(_i5.ModelTypeDefinition),
        ) as _i5.ModelTypeDefinition));
      case 'nonModel':
        return SchemaTypeDefinitionNonModel((serializers.deserialize(
          value,
          specifiedType: const FullType(_i6.NonModelTypeDefinition),
        ) as _i6.NonModelTypeDefinition));
      case 'enum':
        return SchemaTypeDefinitionEnum((serializers.deserialize(
          value,
          specifiedType: const FullType(_i7.EnumTypeDefinition),
        ) as _i7.EnumTypeDefinition));
    }
    return SchemaTypeDefinition.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SchemaTypeDefinition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        SchemaTypeDefinitionModel(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i5.ModelTypeDefinition),
          ),
        SchemaTypeDefinitionNonModel(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i6.NonModelTypeDefinition),
          ),
        SchemaTypeDefinitionEnum(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i7.EnumTypeDefinition),
          ),
        SchemaTypeDefinitionSdkUnknown(:final value) => value,
      },
    ];
  }
}
