// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.type_dimension; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_type_dimension.dart'
    as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class TypeDimension extends _i1.SmithyUnion<TypeDimension> {
  const TypeDimension._();

  const factory TypeDimension.unannotated() = TypeDimensionUnannotated;

  const factory TypeDimension.model(_i2.ModelTypeDimension model) =
      TypeDimensionModel;

  const factory TypeDimension.sdkUnknown(
    String name,
    Object value,
  ) = TypeDimensionSdkUnknown;

  static const List<_i1.SmithySerializer<TypeDimension>> serializers = [
    TypeDimensionRestJson1Serializer()
  ];

  _i1.Unit? get unannotated => null;
  _i2.ModelTypeDimension? get model => null;
  @override
  Object get value => (unannotated ?? model)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'TypeDimension');
    if (unannotated != null) {
      helper.add(
        r'unannotated',
        unannotated,
      );
    }
    if (model != null) {
      helper.add(
        r'model',
        model,
      );
    }
    return helper.toString();
  }
}

final class TypeDimensionUnannotated extends TypeDimension {
  const TypeDimensionUnannotated() : super._();

  @override
  String get name => 'unannotated';
  @override
  _i1.Unit get unannotated => const _i1.Unit();
}

final class TypeDimensionModel extends TypeDimension {
  const TypeDimensionModel(this.model) : super._();

  @override
  final _i2.ModelTypeDimension model;

  @override
  String get name => 'model';
}

final class TypeDimensionSdkUnknown extends TypeDimension {
  const TypeDimensionSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class TypeDimensionRestJson1Serializer
    extends _i1.StructuredSmithySerializer<TypeDimension> {
  const TypeDimensionRestJson1Serializer() : super('TypeDimension');

  @override
  Iterable<Type> get types => const [
        TypeDimension,
        TypeDimensionUnannotated,
        TypeDimensionModel,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  TypeDimension deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'unannotated':
        return const TypeDimensionUnannotated();
      case 'model':
        return TypeDimensionModel((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.ModelTypeDimension),
        ) as _i2.ModelTypeDimension));
    }
    return TypeDimension.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    TypeDimension object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        TypeDimensionUnannotated(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i1.Unit),
          ),
        TypeDimensionModel(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i2.ModelTypeDimension),
          ),
        TypeDimensionSdkUnknown(:final value) => value,
      },
    ];
  }
}
