// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.model_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'model_type.g.dart';

/// A custom structure with an `@model` directive. \`\`\`graphql # \`MyModel` is a model type. type MyModel @model { id: ID! } ```
abstract class ModelType
    with _i1.AWSEquatable<ModelType>
    implements Built<ModelType, ModelTypeBuilder> {
  /// A custom structure with an `@model` directive. \`\`\`graphql # \`MyModel` is a model type. type MyModel @model { id: ID! } ```
  factory ModelType({
    bool? isRequired,
    required String model,
  }) {
    isRequired ??= false;
    return _$ModelType._(
      isRequired: isRequired,
      model: model,
    );
  }

  /// A custom structure with an `@model` directive. \`\`\`graphql # \`MyModel` is a model type. type MyModel @model { id: ID! } ```
  factory ModelType.build([void Function(ModelTypeBuilder) updates]) =
      _$ModelType;

  const ModelType._();

  static const List<_i2.SmithySerializer<ModelType>> serializers = [
    ModelTypeRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ModelTypeBuilder b) {
    b.isRequired = false;
  }

  /// Whether the type is required (non-nullable) in this context.
  bool get isRequired;

  /// The name of the model type, as defined in the schema.
  String get model;
  @override
  List<Object?> get props => [
        isRequired,
        model,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ModelType')
      ..add(
        'isRequired',
        isRequired,
      )
      ..add(
        'model',
        model,
      );
    return helper.toString();
  }
}

class ModelTypeRestJson1Serializer
    extends _i2.StructuredSmithySerializer<ModelType> {
  const ModelTypeRestJson1Serializer() : super('ModelType');

  @override
  Iterable<Type> get types => const [
        ModelType,
        _$ModelType,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ModelType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ModelTypeBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'isRequired':
          result.isRequired = (serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool);
        case 'model':
          result.model = (serializers.deserialize(
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
    ModelType object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ModelType(:isRequired, :model) = object;
    result$.addAll([
      'isRequired',
      serializers.serialize(
        isRequired,
        specifiedType: const FullType(bool),
      ),
      'model',
      serializers.serialize(
        model,
        specifiedType: const FullType(String),
      ),
    ]);
    return result$;
  }
}
