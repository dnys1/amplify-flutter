// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_association_has_many; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;

part 'model_association_has_many.g.dart';

abstract class ModelAssociationHasMany
    with _i1.AWSEquatable<ModelAssociationHasMany>
    implements Built<ModelAssociationHasMany, ModelAssociationHasManyBuilder> {
  factory ModelAssociationHasMany({
    required String connectedModel,
    @Deprecated('Use associatedWithFields instead.')
        required _i2.ModelField associatedWith,
    required List<_i2.ModelField> associatedWithFields,
  }) {
    return _$ModelAssociationHasMany._(
      connectedModel: connectedModel,
      associatedWith: associatedWith,
      associatedWithFields: _i3.BuiltList(associatedWithFields),
    );
  }

  factory ModelAssociationHasMany.build(
          [void Function(ModelAssociationHasManyBuilder) updates]) =
      _$ModelAssociationHasMany;

  const ModelAssociationHasMany._();

  static const List<_i4.SmithySerializer<ModelAssociationHasMany>> serializers =
      [ModelAssociationHasManyRestJson1Serializer()];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelAssociationHasManyBuilder b) {}

  /// The name of the associated model.
  String get connectedModel;
  @Deprecated('Use associatedWithFields instead.')
  _i2.ModelField get associatedWith;
  _i3.BuiltList<_i2.ModelField> get associatedWithFields;
  @override
  List<Object?> get props => [
        connectedModel,
        associatedWith,
        associatedWithFields,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelAssociationHasMany')
      ..add(
        'connectedModel',
        connectedModel,
      )
      ..add(
        'associatedWith',
        associatedWith,
      )
      ..add(
        'associatedWithFields',
        associatedWithFields,
      );
    return helper.toString();
  }
}

class ModelAssociationHasManyRestJson1Serializer
    extends _i4.StructuredSmithySerializer<ModelAssociationHasMany> {
  const ModelAssociationHasManyRestJson1Serializer()
      : super('ModelAssociationHasMany');

  @override
  Iterable<Type> get types => const [
        ModelAssociationHasMany,
        _$ModelAssociationHasMany,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelAssociationHasMany deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelAssociationHasManyBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'associatedWith':
          result.associatedWith.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.ModelField),
          ) as _i2.ModelField));
        case 'associatedWithFields':
          result.associatedWithFields.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltList,
              [FullType(_i2.ModelField)],
            ),
          ) as _i3.BuiltList<_i2.ModelField>));
        case 'connectedModel':
          result.connectedModel = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelAssociationHasMany object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ModelAssociationHasMany(
      :associatedWith,
      :associatedWithFields,
      :connectedModel
    ) = object;
    result$.addAll([
      'associatedWith',
      serializers.serialize(
        associatedWith,
        specifiedType: const FullType(_i2.ModelField),
      ),
      'associatedWithFields',
      serializers.serialize(
        associatedWithFields,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(_i2.ModelField)],
        ),
      ),
      'connectedModel',
      serializers.serialize(
        connectedModel,
        specifiedType: const FullType(String),
      ),
    ]);
    return result$;
  }
}
