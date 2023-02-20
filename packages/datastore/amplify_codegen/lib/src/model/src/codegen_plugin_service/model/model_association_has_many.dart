// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

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
    @Deprecated('Use associatedWithFields instead.')
        required _i2.ModelField associatedWith,
    required List<_i2.ModelField> associatedWithFields,
    required String connectedModel,
  }) {
    return _$ModelAssociationHasMany._(
      associatedWith: associatedWith,
      associatedWithFields: _i3.BuiltList(associatedWithFields),
      connectedModel: connectedModel,
    );
  }

  factory ModelAssociationHasMany.build(
          [void Function(ModelAssociationHasManyBuilder) updates]) =
      _$ModelAssociationHasMany;

  const ModelAssociationHasMany._();

  static const List<_i4.SmithySerializer> serializers = [
    ModelAssociationHasManyRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelAssociationHasManyBuilder b) {}
  @Deprecated('Use associatedWithFields instead.')
  _i2.ModelField get associatedWith;
  _i3.BuiltList<_i2.ModelField> get associatedWithFields;

  /// The name of the associated model.
  String get connectedModel;
  @override
  List<Object?> get props => [
        associatedWith,
        associatedWithFields,
        connectedModel,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelAssociationHasMany');
    helper.add(
      'associatedWith',
      associatedWith,
    );
    helper.add(
      'associatedWithFields',
      associatedWithFields,
    );
    helper.add(
      'connectedModel',
      connectedModel,
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
      switch (key) {
        case 'associatedWith':
          result.associatedWith.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.ModelField),
          ) as _i2.ModelField));
          break;
        case 'associatedWithFields':
          result.associatedWithFields.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltList,
              [FullType(_i2.ModelField)],
            ),
          ) as _i3.BuiltList<_i2.ModelField>));
          break;
        case 'connectedModel':
          result.connectedModel = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final payload = (object as ModelAssociationHasMany);
    final result = <Object?>[
      'associatedWith',
      serializers.serialize(
        payload.associatedWith,
        specifiedType: const FullType(_i2.ModelField),
      ),
      'associatedWithFields',
      serializers.serialize(
        payload.associatedWithFields,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(_i2.ModelField)],
        ),
      ),
      'connectedModel',
      serializers.serialize(
        payload.connectedModel,
        specifiedType: const FullType(String),
      ),
    ];
    return result;
  }
}
