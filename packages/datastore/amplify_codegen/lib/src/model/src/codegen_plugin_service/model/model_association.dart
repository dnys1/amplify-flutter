// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.model_association; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_belongs_to.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_has_many.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_association_has_one.dart'
    as _i4;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

/// The discrete values of [ModelAssociation].
enum ModelAssociationType<T extends ModelAssociation> {
  /// The type for [ModelAssociationBelongsTo$].
  belongsTo<ModelAssociationBelongsTo$>(r'belongsTo'),

  /// The type for [ModelAssociationHasMany$].
  hasMany<ModelAssociationHasMany$>(r'hasMany'),

  /// The type for [ModelAssociationHasOne$].
  hasOne<ModelAssociationHasOne$>(r'hasOne'),

  /// The type for an unknown value.
  sdkUnknown<ModelAssociationSdkUnknown$>('sdkUnknown');

  /// The discrete values of [ModelAssociation].
  const ModelAssociationType(this.value);

  /// The Smithy value.
  final String value;
}

abstract class ModelAssociation extends _i1.SmithyUnion<ModelAssociation> {
  const ModelAssociation._();

  const factory ModelAssociation.belongsTo(
      _i2.ModelAssociationBelongsTo belongsTo) = ModelAssociationBelongsTo$;

  const factory ModelAssociation.hasMany(_i3.ModelAssociationHasMany hasMany) =
      ModelAssociationHasMany$;

  const factory ModelAssociation.hasOne(_i4.ModelAssociationHasOne hasOne) =
      ModelAssociationHasOne$;

  const factory ModelAssociation.sdkUnknown(
    String name,
    Object value,
  ) = ModelAssociationSdkUnknown$;

  static const List<_i1.SmithySerializer<ModelAssociation>> serializers = [
    ModelAssociationRestJson1Serializer()
  ];

  _i2.ModelAssociationBelongsTo? get belongsTo => null;
  _i3.ModelAssociationHasMany? get hasMany => null;
  _i4.ModelAssociationHasOne? get hasOne => null;
  ModelAssociationType get type;
  @override
  Object get value => (belongsTo ?? hasMany ?? hasOne)!;
  @override
  T? when<T>({
    T Function(_i2.ModelAssociationBelongsTo)? belongsTo,
    T Function(_i3.ModelAssociationHasMany)? hasMany,
    T Function(_i4.ModelAssociationHasOne)? hasOne,
    T Function(
      String,
      Object,
    )?
        sdkUnknown,
  }) {
    if (this is ModelAssociationBelongsTo$) {
      return belongsTo?.call((this as ModelAssociationBelongsTo$).belongsTo);
    }
    if (this is ModelAssociationHasMany$) {
      return hasMany?.call((this as ModelAssociationHasMany$).hasMany);
    }
    if (this is ModelAssociationHasOne$) {
      return hasOne?.call((this as ModelAssociationHasOne$).hasOne);
    }
    return sdkUnknown?.call(
      name,
      value,
    );
  }

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

class ModelAssociationBelongsTo$ extends ModelAssociation {
  const ModelAssociationBelongsTo$(this.belongsTo) : super._();

  @override
  final _i2.ModelAssociationBelongsTo belongsTo;

  @override
  ModelAssociationType get type => ModelAssociationType.belongsTo;
  @override
  String get name => 'belongsTo';
}

class ModelAssociationHasMany$ extends ModelAssociation {
  const ModelAssociationHasMany$(this.hasMany) : super._();

  @override
  final _i3.ModelAssociationHasMany hasMany;

  @override
  ModelAssociationType get type => ModelAssociationType.hasMany;
  @override
  String get name => 'hasMany';
}

class ModelAssociationHasOne$ extends ModelAssociation {
  const ModelAssociationHasOne$(this.hasOne) : super._();

  @override
  final _i4.ModelAssociationHasOne hasOne;

  @override
  ModelAssociationType get type => ModelAssociationType.hasOne;
  @override
  String get name => 'hasOne';
}

class ModelAssociationSdkUnknown$ extends ModelAssociation {
  const ModelAssociationSdkUnknown$(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;

  @override
  ModelAssociationType get type => ModelAssociationType.sdkUnknown;
}

class ModelAssociationRestJson1Serializer
    extends _i1.StructuredSmithySerializer<ModelAssociation> {
  const ModelAssociationRestJson1Serializer() : super('ModelAssociation');

  @override
  Iterable<Type> get types => const [
        ModelAssociation,
        ModelAssociationBelongsTo$,
        ModelAssociationHasMany$,
        ModelAssociationHasOne$,
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
    final iterator = serialized.iterator;
    iterator.moveNext();
    final key = iterator.current as String;
    iterator.moveNext();
    final value = iterator.current as Object;
    switch (key) {
      case 'belongsTo':
        return ModelAssociationBelongsTo$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i2.ModelAssociationBelongsTo),
        ) as _i2.ModelAssociationBelongsTo));
      case 'hasMany':
        return ModelAssociationHasMany$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i3.ModelAssociationHasMany),
        ) as _i3.ModelAssociationHasMany));
      case 'hasOne':
        return ModelAssociationHasOne$((serializers.deserialize(
          value,
          specifiedType: const FullType(_i4.ModelAssociationHasOne),
        ) as _i4.ModelAssociationHasOne));
    }
    return ModelAssociation.sdkUnknown(
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
    (object as ModelAssociation);
    return [
      object.name,
      object.when<Object?>(
        belongsTo: (_i2.ModelAssociationBelongsTo belongsTo) =>
            serializers.serialize(
          belongsTo,
          specifiedType: const FullType(_i2.ModelAssociationBelongsTo),
        ),
        hasMany: (_i3.ModelAssociationHasMany hasMany) => serializers.serialize(
          hasMany,
          specifiedType: const FullType(_i3.ModelAssociationHasMany),
        ),
        hasOne: (_i4.ModelAssociationHasOne hasOne) => serializers.serialize(
          hasOne,
          specifiedType: const FullType(_i4.ModelAssociationHasOne),
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
