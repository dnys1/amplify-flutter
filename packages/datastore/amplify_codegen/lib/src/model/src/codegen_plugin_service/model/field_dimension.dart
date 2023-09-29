// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.field_dimension; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/field_auth.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/name_casing.dart'
    as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class FieldDimension extends _i1.SmithyUnion<FieldDimension> {
  const FieldDimension._();

  const factory FieldDimension.casing(_i2.NameCasing casing) =
      FieldDimensionCasing;

  const factory FieldDimension.auth(_i3.FieldAuth auth) = FieldDimensionAuth;

  const factory FieldDimension.sdkUnknown(
    String name,
    Object value,
  ) = FieldDimensionSdkUnknown;

  static const List<_i1.SmithySerializer<FieldDimension>> serializers = [
    FieldDimensionRestJson1Serializer()
  ];

  _i2.NameCasing? get casing => null;
  _i3.FieldAuth? get auth => null;
  @override
  Object get value => (casing ?? auth)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'FieldDimension');
    if (casing != null) {
      helper.add(
        r'casing',
        casing,
      );
    }
    if (auth != null) {
      helper.add(
        r'auth',
        auth,
      );
    }
    return helper.toString();
  }
}

final class FieldDimensionCasing extends FieldDimension {
  const FieldDimensionCasing(this.casing) : super._();

  @override
  final _i2.NameCasing casing;

  @override
  String get name => 'casing';
}

final class FieldDimensionAuth extends FieldDimension {
  const FieldDimensionAuth(this.auth) : super._();

  @override
  final _i3.FieldAuth auth;

  @override
  String get name => 'auth';
}

final class FieldDimensionSdkUnknown extends FieldDimension {
  const FieldDimensionSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class FieldDimensionRestJson1Serializer
    extends _i1.StructuredSmithySerializer<FieldDimension> {
  const FieldDimensionRestJson1Serializer() : super('FieldDimension');

  @override
  Iterable<Type> get types => const [
        FieldDimension,
        FieldDimensionCasing,
        FieldDimensionAuth,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  FieldDimension deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'casing':
        return FieldDimensionCasing((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.NameCasing),
        ) as _i2.NameCasing));
      case 'auth':
        return FieldDimensionAuth((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.FieldAuth),
        ) as _i3.FieldAuth));
    }
    return FieldDimension.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    FieldDimension object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        FieldDimensionCasing(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i2.NameCasing),
          ),
        FieldDimensionAuth(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i3.FieldAuth),
          ),
        FieldDimensionSdkUnknown(:final value) => value,
      },
    ];
  }
}
