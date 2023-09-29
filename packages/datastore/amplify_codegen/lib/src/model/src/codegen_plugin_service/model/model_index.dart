// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_index; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_foreign_key.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_primary_key.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_secondary_key.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class ModelIndex extends _i1.SmithyUnion<ModelIndex> {
  const ModelIndex._();

  factory ModelIndex.primaryKey({
    required String primaryField,
    List<String>? sortKeyFields,
  }) =>
      ModelIndexPrimaryKey(_i2.ModelPrimaryKey(
        primaryField: primaryField,
        sortKeyFields: sortKeyFields,
      ));

  factory ModelIndex.secondaryKey({
    required String primaryField,
    List<String>? sortKeyFields,
    required String name,
    required String queryField,
  }) =>
      ModelIndexSecondaryKey(_i3.ModelSecondaryKey(
        primaryField: primaryField,
        sortKeyFields: sortKeyFields,
        name: name,
        queryField: queryField,
      ));

  factory ModelIndex.foreignKey({
    required String primaryField,
    required List<String> sortKeyFields,
    required String name,
  }) =>
      ModelIndexForeignKey(_i4.ModelForeignKey(
        primaryField: primaryField,
        sortKeyFields: sortKeyFields,
        name: name,
      ));

  const factory ModelIndex.sdkUnknown(
    String name,
    Object value,
  ) = ModelIndexSdkUnknown;

  static const List<_i1.SmithySerializer<ModelIndex>> serializers = [
    ModelIndexRestJson1Serializer()
  ];

  /// An `@primaryKey` model index.
  _i2.ModelPrimaryKey? get primaryKey => null;

  /// An `@index` model index.
  _i3.ModelSecondaryKey? get secondaryKey => null;

  /// A foreign key model index, which is a special case of a secondary key.
  _i4.ModelForeignKey? get foreignKey => null;
  @override
  Object get value => (primaryKey ?? secondaryKey ?? foreignKey)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'ModelIndex');
    if (primaryKey != null) {
      helper.add(
        r'primaryKey',
        primaryKey,
      );
    }
    if (secondaryKey != null) {
      helper.add(
        r'secondaryKey',
        secondaryKey,
      );
    }
    if (foreignKey != null) {
      helper.add(
        r'foreignKey',
        foreignKey,
      );
    }
    return helper.toString();
  }
}

final class ModelIndexPrimaryKey extends ModelIndex {
  const ModelIndexPrimaryKey(this.primaryKey) : super._();

  @override
  final _i2.ModelPrimaryKey primaryKey;

  @override
  String get name => 'primaryKey';
}

final class ModelIndexSecondaryKey extends ModelIndex {
  const ModelIndexSecondaryKey(this.secondaryKey) : super._();

  @override
  final _i3.ModelSecondaryKey secondaryKey;

  @override
  String get name => 'secondaryKey';
}

final class ModelIndexForeignKey extends ModelIndex {
  const ModelIndexForeignKey(this.foreignKey) : super._();

  @override
  final _i4.ModelForeignKey foreignKey;

  @override
  String get name => 'foreignKey';
}

final class ModelIndexSdkUnknown extends ModelIndex {
  const ModelIndexSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class ModelIndexRestJson1Serializer
    extends _i1.StructuredSmithySerializer<ModelIndex> {
  const ModelIndexRestJson1Serializer() : super('ModelIndex');

  @override
  Iterable<Type> get types => const [
        ModelIndex,
        ModelIndexPrimaryKey,
        ModelIndexSecondaryKey,
        ModelIndexForeignKey,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelIndex deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'primaryKey':
        return ModelIndexPrimaryKey((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.ModelPrimaryKey),
        ) as _i2.ModelPrimaryKey));
      case 'secondaryKey':
        return ModelIndexSecondaryKey((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.ModelSecondaryKey),
        ) as _i3.ModelSecondaryKey));
      case 'foreignKey':
        return ModelIndexForeignKey((serializers.deserialize(
          value,
          specifiedType: const FullType(_i4.ModelForeignKey),
        ) as _i4.ModelForeignKey));
    }
    return ModelIndex.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelIndex object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        ModelIndexPrimaryKey(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i2.ModelPrimaryKey),
          ),
        ModelIndexSecondaryKey(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i3.ModelSecondaryKey),
          ),
        ModelIndexForeignKey(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i4.ModelForeignKey),
          ),
        ModelIndexSdkUnknown(:final value) => value,
      },
    ];
  }
}
