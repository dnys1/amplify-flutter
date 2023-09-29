// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_type_dimension; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_auth.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/name_casing.dart'
    as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class ModelTypeDimension extends _i1.SmithyUnion<ModelTypeDimension> {
  const ModelTypeDimension._();

  const factory ModelTypeDimension.casing(_i2.NameCasing casing) =
      ModelTypeDimensionCasing;

  const factory ModelTypeDimension.auth(_i3.ModelAuth auth) =
      ModelTypeDimensionAuth;

  const factory ModelTypeDimension.sdkUnknown(
    String name,
    Object value,
  ) = ModelTypeDimensionSdkUnknown;

  static const List<_i1.SmithySerializer<ModelTypeDimension>> serializers = [
    ModelTypeDimensionRestJson1Serializer()
  ];

  _i2.NameCasing? get casing => null;
  _i3.ModelAuth? get auth => null;
  @override
  Object get value => (casing ?? auth)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'ModelTypeDimension');
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

final class ModelTypeDimensionCasing extends ModelTypeDimension {
  const ModelTypeDimensionCasing(this.casing) : super._();

  @override
  final _i2.NameCasing casing;

  @override
  String get name => 'casing';
}

final class ModelTypeDimensionAuth extends ModelTypeDimension {
  const ModelTypeDimensionAuth(this.auth) : super._();

  @override
  final _i3.ModelAuth auth;

  @override
  String get name => 'auth';
}

final class ModelTypeDimensionSdkUnknown extends ModelTypeDimension {
  const ModelTypeDimensionSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class ModelTypeDimensionRestJson1Serializer
    extends _i1.StructuredSmithySerializer<ModelTypeDimension> {
  const ModelTypeDimensionRestJson1Serializer() : super('ModelTypeDimension');

  @override
  Iterable<Type> get types => const [
        ModelTypeDimension,
        ModelTypeDimensionCasing,
        ModelTypeDimensionAuth,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelTypeDimension deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'casing':
        return ModelTypeDimensionCasing((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.NameCasing),
        ) as _i2.NameCasing));
      case 'auth':
        return ModelTypeDimensionAuth((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.ModelAuth),
        ) as _i3.ModelAuth));
    }
    return ModelTypeDimension.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelTypeDimension object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        ModelTypeDimensionCasing(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i2.NameCasing),
          ),
        ModelTypeDimensionAuth(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i3.ModelAuth),
          ),
        ModelTypeDimensionSdkUnknown(:final value) => value,
      },
    ];
  }
}
