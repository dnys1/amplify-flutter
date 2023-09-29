// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_association_belongs_to; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'model_association_belongs_to.g.dart';

abstract class ModelAssociationBelongsTo
    with _i1.AWSEquatable<ModelAssociationBelongsTo>
    implements
        Built<ModelAssociationBelongsTo, ModelAssociationBelongsToBuilder> {
  factory ModelAssociationBelongsTo({
    required String connectedModel,
    @Deprecated('Use targetNames instead.') required String targetName,
    required List<String> targetNames,
  }) {
    return _$ModelAssociationBelongsTo._(
      connectedModel: connectedModel,
      targetName: targetName,
      targetNames: _i2.BuiltList(targetNames),
    );
  }

  factory ModelAssociationBelongsTo.build(
          [void Function(ModelAssociationBelongsToBuilder) updates]) =
      _$ModelAssociationBelongsTo;

  const ModelAssociationBelongsTo._();

  static const List<_i3.SmithySerializer<ModelAssociationBelongsTo>>
      serializers = [ModelAssociationBelongsToRestJson1Serializer()];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelAssociationBelongsToBuilder b) {}

  /// The name of the associated model.
  String get connectedModel;
  @Deprecated('Use targetNames instead.')
  String get targetName;
  _i2.BuiltList<String> get targetNames;
  @override
  List<Object?> get props => [
        connectedModel,
        targetName,
        targetNames,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelAssociationBelongsTo')
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
      );
    return helper.toString();
  }
}

class ModelAssociationBelongsToRestJson1Serializer
    extends _i3.StructuredSmithySerializer<ModelAssociationBelongsTo> {
  const ModelAssociationBelongsToRestJson1Serializer()
      : super('ModelAssociationBelongsTo');

  @override
  Iterable<Type> get types => const [
        ModelAssociationBelongsTo,
        _$ModelAssociationBelongsTo,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelAssociationBelongsTo deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelAssociationBelongsToBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
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
              _i2.BuiltList,
              [FullType(String)],
            ),
          ) as _i2.BuiltList<String>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ModelAssociationBelongsTo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ModelAssociationBelongsTo(
      :connectedModel,
      :targetName,
      :targetNames
    ) = object;
    result$.addAll([
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
          _i2.BuiltList,
          [FullType(String)],
        ),
      ),
    ]);
    return result$;
  }
}
