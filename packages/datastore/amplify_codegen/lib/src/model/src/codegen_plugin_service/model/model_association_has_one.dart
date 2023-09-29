// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_association_has_one; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;

part 'model_association_has_one.g.dart';

abstract class ModelAssociationHasOne
    with _i1.AWSEquatable<ModelAssociationHasOne>
    implements Built<ModelAssociationHasOne, ModelAssociationHasOneBuilder> {
  factory ModelAssociationHasOne({
    required String connectedModel,
    @Deprecated('Use targetNames instead.')
        required String targetName,
    required List<String> targetNames,
    @Deprecated('Use associatedWithFields instead.')
        required _i2.ModelField associatedWith,
    required List<_i2.ModelField> associatedWithFields,
  }) {
    return _$ModelAssociationHasOne._(
      connectedModel: connectedModel,
      targetName: targetName,
      targetNames: _i3.BuiltList(targetNames),
      associatedWith: associatedWith,
      associatedWithFields: _i3.BuiltList(associatedWithFields),
    );
  }

  factory ModelAssociationHasOne.build(
          [void Function(ModelAssociationHasOneBuilder) updates]) =
      _$ModelAssociationHasOne;

  const ModelAssociationHasOne._();

  static const List<_i4.SmithySerializer<ModelAssociationHasOne>> serializers =
      [ModelAssociationHasOneRestJson1Serializer()];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelAssociationHasOneBuilder b) {}

  /// The name of the associated model.
  String get connectedModel;
  @Deprecated('Use targetNames instead.')
  String get targetName;
  _i3.BuiltList<String> get targetNames;
  @Deprecated('Use associatedWithFields instead.')
  _i2.ModelField get associatedWith;
  _i3.BuiltList<_i2.ModelField> get associatedWithFields;
  @override
  List<Object?> get props => [
        connectedModel,
        targetName,
        targetNames,
        associatedWith,
        associatedWithFields,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelAssociationHasOne')
      ..add(
        'connectedModel',
        connectedModel,
      )
      ..add(
        'targetName',
        targetName,
      )
      ..add(
        'targetNames',
        targetNames,
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

class ModelAssociationHasOneRestJson1Serializer
    extends _i4.StructuredSmithySerializer<ModelAssociationHasOne> {
  const ModelAssociationHasOneRestJson1Serializer()
      : super('ModelAssociationHasOne');

  @override
  Iterable<Type> get types => const [
        ModelAssociationHasOne,
        _$ModelAssociationHasOne,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelAssociationHasOne deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelAssociationHasOneBuilder();
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
        case 'targetName':
          result.targetName = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'targetNames':
          result.targetNames.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltList,
              [FullType(String)],
            ),
          ) as _i3.BuiltList<String>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelAssociationHasOne object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ModelAssociationHasOne(
      :associatedWith,
      :associatedWithFields,
      :connectedModel,
      :targetName,
      :targetNames
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
      'targetName',
      serializers.serialize(
        targetName,
        specifiedType: const FullType(String),
      ),
      'targetNames',
      serializers.serialize(
        targetNames,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(String)],
        ),
      ),
    ]);
    return result$;
  }
}
