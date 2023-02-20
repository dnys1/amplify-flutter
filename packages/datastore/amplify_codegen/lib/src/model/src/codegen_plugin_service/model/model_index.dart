// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.model_index; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_foreign_key.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_primary_key.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_secondary_key.dart'
    as _i4;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

/// The discrete values of [ModelIndex].
enum ModelIndexType<T extends ModelIndex> {
  /// The type for [ModelIndexForeignKey$].
  foreignKey<ModelIndexForeignKey$>(r'foreignKey'),

  /// The type for [ModelIndexPrimaryKey$].
  primaryKey<ModelIndexPrimaryKey$>(r'primaryKey'),

  /// The type for [ModelIndexSecondaryKey$].
  secondaryKey<ModelIndexSecondaryKey$>(r'secondaryKey'),

  /// The type for an unknown value.
  sdkUnknown<ModelIndexSdkUnknown$>('sdkUnknown');

  /// The discrete values of [ModelIndex].
  const ModelIndexType(this.value);

  /// The Smithy value.
  final String value;
}

abstract class ModelIndex extends _i1.SmithyUnion<ModelIndex> {
  const ModelIndex._();

  const factory ModelIndex.foreignKey(_i2.ModelForeignKey foreignKey) =
      ModelIndexForeignKey$;

  const factory ModelIndex.primaryKey(_i3.ModelPrimaryKey primaryKey) =
      ModelIndexPrimaryKey$;

  const factory ModelIndex.secondaryKey(_i4.ModelSecondaryKey secondaryKey) =
      ModelIndexSecondaryKey$;

  const factory ModelIndex.sdkUnknown(
    String name,
    Object value,
  ) = ModelIndexSdkUnknown$;

  static const List<_i1.SmithySerializer<ModelIndex>> serializers = [
    ModelIndexRestJson1Serializer()
  ];

  /// A foreign key model index, which is a special case of a secondary key.
  _i2.ModelForeignKey? get foreignKey => null;

  /// An `@primaryKey` model index.
  _i3.ModelPrimaryKey? get primaryKey => null;

  /// An `@index` model index.
  _i4.ModelSecondaryKey? get secondaryKey => null;
  ModelIndexType get type;
  @override
  Object get value => (foreignKey ?? primaryKey ?? secondaryKey)!;
  @override
  T? when<T>({
    T Function(_i2.ModelForeignKey)? foreignKey,
    T Function(_i3.ModelPrimaryKey)? primaryKey,
    T Function(_i4.ModelSecondaryKey)? secondaryKey,
    T Function(
      String,
      Object,
    )?
        sdkUnknown,
  }) {
    if (this is ModelIndexForeignKey$) {
      return foreignKey?.call((this as ModelIndexForeignKey$).foreignKey);
    }
    if (this is ModelIndexPrimaryKey$) {
      return primaryKey?.call((this as ModelIndexPrimaryKey$).primaryKey);
    }
    if (this is ModelIndexSecondaryKey$) {
      return secondaryKey?.call((this as ModelIndexSecondaryKey$).secondaryKey);
    }
    return sdkUnknown?.call(
      name,
      value,
    );
  }

  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'ModelIndex');
    if (foreignKey != null) {
      helper.add(
        r'foreignKey',
        foreignKey,
      );
    }
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
    return helper.toString();
  }
}

class ModelIndexForeignKey$ extends ModelIndex {
  const ModelIndexForeignKey$(this.foreignKey) : super._();

  @override
  final _i2.ModelForeignKey foreignKey;

  @override
  ModelIndexType get type => ModelIndexType.foreignKey;
  @override
  String get name => 'foreignKey';
}

class ModelIndexPrimaryKey$ extends ModelIndex {
  const ModelIndexPrimaryKey$(this.primaryKey) : super._();

  @override
  final _i3.ModelPrimaryKey primaryKey;

  @override
  ModelIndexType get type => ModelIndexType.primaryKey;
  @override
  String get name => 'primaryKey';
}

class ModelIndexSecondaryKey$ extends ModelIndex {
  const ModelIndexSecondaryKey$(this.secondaryKey) : super._();

  @override
  final _i4.ModelSecondaryKey secondaryKey;

  @override
  ModelIndexType get type => ModelIndexType.secondaryKey;
  @override
  String get name => 'secondaryKey';
}

class ModelIndexSdkUnknown$ extends ModelIndex {
  const ModelIndexSdkUnknown$(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;

  @override
  ModelIndexType get type => ModelIndexType.sdkUnknown;
}

class ModelIndexRestJson1Serializer
    extends _i1.StructuredSmithySerializer<ModelIndex> {
  const ModelIndexRestJson1Serializer() : super('ModelIndex');

  @override
  Iterable<Type> get types => const [
        ModelIndex,
        ModelIndexForeignKey$,
        ModelIndexPrimaryKey$,
        ModelIndexSecondaryKey$,
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
    final iterator = serialized.iterator;
    iterator.moveNext();
    final key = iterator.current as String;
    iterator.moveNext();
    final value = iterator.current as Object;
    switch (key) {
      case 'foreignKey':
        return ModelIndexForeignKey$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.ModelForeignKey),
        ) as _i2.ModelForeignKey));
      case 'primaryKey':
        return ModelIndexPrimaryKey$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.ModelPrimaryKey),
        ) as _i3.ModelPrimaryKey));
      case 'secondaryKey':
        return ModelIndexSecondaryKey$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i4.ModelSecondaryKey),
        ) as _i4.ModelSecondaryKey));
    }
    return ModelIndex.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    (object as ModelIndex);
    return [
      object.name,
      object.when<Object?>(
        foreignKey: (_i2.ModelForeignKey foreignKey) => serializers.serialize(
          foreignKey,
          specifiedType: const FullType(_i2.ModelForeignKey),
        ),
        primaryKey: (_i3.ModelPrimaryKey primaryKey) => serializers.serialize(
          primaryKey,
          specifiedType: const FullType(_i3.ModelPrimaryKey),
        ),
        secondaryKey: (_i4.ModelSecondaryKey secondaryKey) =>
            serializers.serialize(
          secondaryKey,
          specifiedType: const FullType(_i4.ModelSecondaryKey),
        ),
        sdkUnknown: (
          String _,
          Object sdkUnknown,
        ) =>
            sdkUnknown,
      )!,
    ];
  }
}
