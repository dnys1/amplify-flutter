// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.scalar_type; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/app_sync_scalar.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'scalar_type.g.dart';

/// A scalar (primitive) type, e.g. \`ID\`, \`String\`, \`AWSDateTime\`. AppSync defines 9 \[scalar types\](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html) on top of the default 5 GraphQL scalar types (\`ID\`, \`String\`, \`Int\`, \`Float\`, \`Boolean\`): - \`AWSDate\` - \`AWSTime\` - \`AWSDateTime\` - \`AWSTimestamp\` - \`AWSEmail\` - \`AWSJSON\` - \`AWSURL\` - \`AWSPhone\` - \`AWSIPAddress\`
abstract class ScalarType
    with _i1.AWSEquatable<ScalarType>
    implements Built<ScalarType, ScalarTypeBuilder> {
  /// A scalar (primitive) type, e.g. \`ID\`, \`String\`, \`AWSDateTime\`. AppSync defines 9 \[scalar types\](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html) on top of the default 5 GraphQL scalar types (\`ID\`, \`String\`, \`Int\`, \`Float\`, \`Boolean\`): - \`AWSDate\` - \`AWSTime\` - \`AWSDateTime\` - \`AWSTimestamp\` - \`AWSEmail\` - \`AWSJSON\` - \`AWSURL\` - \`AWSPhone\` - \`AWSIPAddress\`
  factory ScalarType({
    bool? isRequired,
    required _i2.AppSyncScalar scalar,
  }) {
    isRequired ??= false;
    return _$ScalarType._(
      isRequired: isRequired,
      scalar: scalar,
    );
  }

  /// A scalar (primitive) type, e.g. \`ID\`, \`String\`, \`AWSDateTime\`. AppSync defines 9 \[scalar types\](https://docs.aws.amazon.com/appsync/latest/devguide/scalars.html) on top of the default 5 GraphQL scalar types (\`ID\`, \`String\`, \`Int\`, \`Float\`, \`Boolean\`): - \`AWSDate\` - \`AWSTime\` - \`AWSDateTime\` - \`AWSTimestamp\` - \`AWSEmail\` - \`AWSJSON\` - \`AWSURL\` - \`AWSPhone\` - \`AWSIPAddress\`
  factory ScalarType.build([void Function(ScalarTypeBuilder) updates]) =
      _$ScalarType;

  const ScalarType._();

  static const List<_i3.SmithySerializer<ScalarType>> serializers = [
    ScalarTypeRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ScalarTypeBuilder b) {
    b.isRequired = false;
  }

  /// Whether the type is required (non-nullable) in this context.
  bool get isRequired;

  /// The AppSync scalar type, as defined in the schema.
  _i2.AppSyncScalar get scalar;
  @override
  List<Object?> get props => [
        isRequired,
        scalar,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ScalarType')
      ..add(
        'isRequired',
        isRequired,
      )
      ..add(
        'scalar',
        scalar,
      );
    return helper.toString();
  }
}

class ScalarTypeRestJson1Serializer
    extends _i3.StructuredSmithySerializer<ScalarType> {
  const ScalarTypeRestJson1Serializer() : super('ScalarType');

  @override
  Iterable<Type> get types => const [
        ScalarType,
        _$ScalarType,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  ScalarType deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScalarTypeBuilder();
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
        case 'scalar':
          result.scalar = (serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.AppSyncScalar),
          ) as _i2.AppSyncScalar);
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ScalarType object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final ScalarType(:isRequired, :scalar) = object;
    result$.addAll([
      'isRequired',
      serializers.serialize(
        isRequired,
        specifiedType: const FullType(bool),
      ),
      'scalar',
      serializers.serialize(
        scalar,
        specifiedType: const FullType(_i2.AppSyncScalar),
      ),
    ]);
    return result$;
  }
}
