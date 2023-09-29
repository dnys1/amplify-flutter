// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.schema_dimension; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/auth_rule.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/field_dimension.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/globals.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/type_description.dart'
    as _i6;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/type_dimension.dart'
    as _i4;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class SchemaDimension extends _i1.SmithyUnion<SchemaDimension> {
  const SchemaDimension._();

  factory SchemaDimension.globals({_i2.AuthRule? globalAuthRule}) =>
      SchemaDimensionGlobals(_i3.Globals(globalAuthRule: globalAuthRule));

  factory SchemaDimension.type({
    required _i4.TypeDimension typeDimension,
    List<_i5.FieldDimension>? fieldDimensions,
  }) =>
      SchemaDimensionType(_i6.TypeDescription(
        typeDimension: typeDimension,
        fieldDimensions: fieldDimensions,
      ));

  const factory SchemaDimension.sdkUnknown(
    String name,
    Object value,
  ) = SchemaDimensionSdkUnknown;

  static const List<_i1.SmithySerializer<SchemaDimension>> serializers = [
    SchemaDimensionRestJson1Serializer()
  ];

  _i3.Globals? get globals => null;
  _i6.TypeDescription? get type => null;
  @override
  Object get value => (globals ?? type)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'SchemaDimension');
    if (globals != null) {
      helper.add(
        r'globals',
        globals,
      );
    }
    if (type != null) {
      helper.add(
        r'type',
        type,
      );
    }
    return helper.toString();
  }
}

final class SchemaDimensionGlobals extends SchemaDimension {
  const SchemaDimensionGlobals(this.globals) : super._();

  @override
  final _i3.Globals globals;

  @override
  String get name => 'globals';
}

final class SchemaDimensionType extends SchemaDimension {
  const SchemaDimensionType(this.type) : super._();

  @override
  final _i6.TypeDescription type;

  @override
  String get name => 'type';
}

final class SchemaDimensionSdkUnknown extends SchemaDimension {
  const SchemaDimensionSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class SchemaDimensionRestJson1Serializer
    extends _i1.StructuredSmithySerializer<SchemaDimension> {
  const SchemaDimensionRestJson1Serializer() : super('SchemaDimension');

  @override
  Iterable<Type> get types => const [
        SchemaDimension,
        SchemaDimensionGlobals,
        SchemaDimensionType,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  SchemaDimension deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'globals':
        return SchemaDimensionGlobals((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.Globals),
        ) as _i3.Globals));
      case 'type':
        return SchemaDimensionType((serializers.deserialize(
          value,
          specifiedType: const FullType(_i6.TypeDescription),
        ) as _i6.TypeDescription));
    }
    return SchemaDimension.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SchemaDimension object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        SchemaDimensionGlobals(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i3.Globals),
          ),
        SchemaDimensionType(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i6.TypeDescription),
          ),
        SchemaDimensionSdkUnknown(:final value) => value,
      },
    ];
  }
}
