// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_association; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_belongs_to.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_has_many.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_has_one.dart'
    as _i5;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class ModelAssociation extends _i1.SmithyUnion<ModelAssociation> {
  const ModelAssociation._();

  factory ModelAssociation.belongsTo({
    required String connectedModel,
    @Deprecated('Use targetNames instead.') required String targetName,
    required List<String> targetNames,
  }) =>
      ModelAssociationBelongsTo(_i2.ModelAssociationBelongsTo(
        connectedModel: connectedModel,
        targetName: targetName,
        targetNames: targetNames,
      ));

  factory ModelAssociation.hasMany({
    required String connectedModel,
    @Deprecated('Use associatedWithFields instead.')
        required _i3.ModelField associatedWith,
    required List<_i3.ModelField> associatedWithFields,
  }) =>
      ModelAssociationHasMany(_i4.ModelAssociationHasMany(
        connectedModel: connectedModel,
        associatedWith: associatedWith,
        associatedWithFields: associatedWithFields,
      ));

  factory ModelAssociation.hasOne({
    required String connectedModel,
    @Deprecated('Use targetNames instead.')
        required String targetName,
    required List<String> targetNames,
    @Deprecated('Use associatedWithFields instead.')
        required _i3.ModelField associatedWith,
    required List<_i3.ModelField> associatedWithFields,
  }) =>
      ModelAssociationHasOne(_i5.ModelAssociationHasOne(
        connectedModel: connectedModel,
        targetName: targetName,
        targetNames: targetNames,
        associatedWith: associatedWith,
        associatedWithFields: associatedWithFields,
      ));

  const factory ModelAssociation.sdkUnknown(
    String name,
    Object value,
  ) = ModelAssociationSdkUnknown;

  static const List<_i1.SmithySerializer<ModelAssociation>> serializers = [
    ModelAssociationRestJson1Serializer()
  ];

  _i2.ModelAssociationBelongsTo? get belongsTo => null;
  _i4.ModelAssociationHasMany? get hasMany => null;
  _i5.ModelAssociationHasOne? get hasOne => null;
  @override
  Object get value => (belongsTo ?? hasMany ?? hasOne)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'ModelAssociation');
    if (belongsTo != null) {
      helper.add(
        r'belongsTo',
        belongsTo,
      );
    }
    if (hasMany != null) {
      helper.add(
        r'hasMany',
        hasMany,
      );
    }
    if (hasOne != null) {
      helper.add(
        r'hasOne',
        hasOne,
      );
    }
    return helper.toString();
  }
}

final class ModelAssociationBelongsTo extends ModelAssociation {
  const ModelAssociationBelongsTo(this.belongsTo) : super._();

  @override
  final _i2.ModelAssociationBelongsTo belongsTo;

  @override
  String get name => 'belongsTo';
}

final class ModelAssociationHasMany extends ModelAssociation {
  const ModelAssociationHasMany(this.hasMany) : super._();

  @override
  final _i4.ModelAssociationHasMany hasMany;

  @override
  String get name => 'hasMany';
}

final class ModelAssociationHasOne extends ModelAssociation {
  const ModelAssociationHasOne(this.hasOne) : super._();

  @override
  final _i5.ModelAssociationHasOne hasOne;

  @override
  String get name => 'hasOne';
}

final class ModelAssociationSdkUnknown extends ModelAssociation {
  const ModelAssociationSdkUnknown(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class ModelAssociationRestJson1Serializer
    extends _i1.StructuredSmithySerializer<ModelAssociation> {
  const ModelAssociationRestJson1Serializer() : super('ModelAssociation');

  @override
  Iterable<Type> get types => const [
        ModelAssociation,
        ModelAssociationBelongsTo,
        ModelAssociationHasMany,
        ModelAssociationHasOne,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelAssociation deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'belongsTo':
        return ModelAssociationBelongsTo((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.ModelAssociationBelongsTo),
        ) as _i2.ModelAssociationBelongsTo));
      case 'hasMany':
        return ModelAssociationHasMany((serializers.deserialize(
          value,
          specifiedType: const FullType(_i4.ModelAssociationHasMany),
        ) as _i4.ModelAssociationHasMany));
      case 'hasOne':
        return ModelAssociationHasOne((serializers.deserialize(
          value,
          specifiedType: const FullType(_i5.ModelAssociationHasOne),
        ) as _i5.ModelAssociationHasOne));
    }
    return ModelAssociation.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelAssociation object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        ModelAssociationBelongsTo(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i2.ModelAssociationBelongsTo),
          ),
        ModelAssociationHasMany(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i4.ModelAssociationHasMany),
          ),
        ModelAssociationHasOne(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(_i5.ModelAssociationHasOne),
          ),
        ModelAssociationSdkUnknown(:final value) => value,
      },
    ];
  }
}
