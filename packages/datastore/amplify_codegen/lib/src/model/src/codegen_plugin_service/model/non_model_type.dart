// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.non_model_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'non_model_type.g.dart';

/// A custom structure without an `@model` directive. \`\`\`graphql # \`MyNonModel` is a non-model type. type MyNonModel { name: String! } ```
abstract class NonModelType
    with _i1.AWSEquatable<NonModelType>
    implements Built<NonModelType, NonModelTypeBuilder> {
  /// A custom structure without an `@model` directive. \`\`\`graphql # \`MyNonModel` is a non-model type. type MyNonModel { name: String! } ```
  factory NonModelType({
    bool? isRequired,
    required String nonModel,
  }) {
    isRequired ??= false;
    return _$NonModelType._(
      isRequired: isRequired,
      nonModel: nonModel,
    );
  }

  /// A custom structure without an `@model` directive. \`\`\`graphql # \`MyNonModel` is a non-model type. type MyNonModel { name: String! } ```
  factory NonModelType.build([void Function(NonModelTypeBuilder) updates]) =
      _$NonModelType;

  const NonModelType._();

  static const List<_i2.SmithySerializer> serializers = [
    NonModelTypeRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(NonModelTypeBuilder b) {
    b.isRequired = false;
  }

  /// Whether the type is required (non-nullable) in this context.
  bool get isRequired;

  /// The name of the non-model type, as defined in the schema.
  String get nonModel;
  @override
  List<Object?> get props => [
        isRequired,
        nonModel,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('NonModelType');
    helper.add(
      'isRequired',
      isRequired,
    );
    helper.add(
      'nonModel',
      nonModel,
    );
    return helper.toString();
  }
}

class NonModelTypeRestJson1Serializer
    extends _i2.StructuredSmithySerializer<NonModelType> {
  const NonModelTypeRestJson1Serializer() : super('NonModelType');

  @override
  Iterable<Type> get types => const [
        NonModelType,
        _$NonModelType,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  NonModelType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NonModelTypeBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'isRequired':
          result.isRequired = (serializers.deserialize(
            value!,
            specifiedType: const FullType(bool),
          ) as bool);
          break;
        case 'nonModel':
          result.nonModel = (serializers.deserialize(
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
    final payload = (object as NonModelType);
    final result = <Object?>[
      'isRequired',
      serializers.serialize(
        payload.isRequired,
        specifiedType: const FullType(bool),
      ),
      'nonModel',
      serializers.serialize(
        payload.nonModel,
        specifiedType: const FullType(String),
      ),
    ];
    return result;
  }
}
