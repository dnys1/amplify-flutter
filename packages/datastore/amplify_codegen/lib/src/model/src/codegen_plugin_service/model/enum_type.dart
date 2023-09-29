// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.enum_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'enum_type.g.dart';

/// A custom enumeration. \`\`\`graphql # \`MyEnum` is an enum type. enum MyEnum { VALUE1 VALUE2 } ```
abstract class EnumType
    with _i1.AWSEquatable<EnumType>
    implements Built<EnumType, EnumTypeBuilder> {
  /// A custom enumeration. \`\`\`graphql # \`MyEnum` is an enum type. enum MyEnum { VALUE1 VALUE2 } ```
  factory EnumType({
    bool? isRequired,
    required String enum_,
  }) {
    isRequired ??= false;
    return _$EnumType._(
      isRequired: isRequired,
      enum_: enum_,
    );
  }

  /// A custom enumeration. \`\`\`graphql # \`MyEnum` is an enum type. enum MyEnum { VALUE1 VALUE2 } ```
  factory EnumType.build([void Function(EnumTypeBuilder) updates]) = _$EnumType;

  const EnumType._();

  static const List<_i2.SmithySerializer<EnumType>> serializers = [
    EnumTypeRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(EnumTypeBuilder b) {
    b.isRequired = false;
  }

  /// Whether the type is required (non-nullable) in this context.
  bool get isRequired;

  /// The name of the enum type, as defined in the schema.
  String get enum_;
  @override
  List<Object?> get props => [
        isRequired,
        enum_,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('EnumType')
      ..add(
        'isRequired',
        isRequired,
      )
      ..add(
        'enum_',
        enum_,
      );
    return helper.toString();
  }
}

class EnumTypeRestJson1Serializer
    extends _i2.StructuredSmithySerializer<EnumType> {
  const EnumTypeRestJson1Serializer() : super('EnumType');

  @override
  Iterable<Type> get types => const [
        EnumType,
        _$EnumType,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  EnumType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnumTypeBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'enum':
          result.enum_ = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'isRequired':
          result.isRequired = (serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    EnumType object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final EnumType(:enum_, :isRequired) = object;
    result$.addAll([
      'enum',
      serializers.serialize(
        enum_,
        specifiedType: const FullType(String),
      ),
      'isRequired',
      serializers.serialize(
        isRequired,
        specifiedType: const FullType(bool),
      ),
    ]);
    return result$;
  }
}
