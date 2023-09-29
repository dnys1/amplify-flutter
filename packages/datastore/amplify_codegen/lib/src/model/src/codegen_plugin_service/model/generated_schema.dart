// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.generated_schema; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_definition.dart'
    as _i3;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_description.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;

part 'generated_schema.g.dart';

abstract class GeneratedSchema
    with _i1.AWSEquatable<GeneratedSchema>
    implements Built<GeneratedSchema, GeneratedSchemaBuilder> {
  factory GeneratedSchema({
    required _i2.SchemaDescription description,
    required _i3.SchemaDefinition mipr,
  }) {
    return _$GeneratedSchema._(
      description: description,
      mipr: mipr,
    );
  }

  factory GeneratedSchema.build(
      [void Function(GeneratedSchemaBuilder) updates]) = _$GeneratedSchema;

  const GeneratedSchema._();

  static const List<_i4.SmithySerializer<GeneratedSchema>> serializers = [
    GeneratedSchemaRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(GeneratedSchemaBuilder b) {}

  /// The dimensional description of the generated schema
  _i2.SchemaDescription get description;

  /// The schema MIPR
  _i3.SchemaDefinition get mipr;
  @override
  List<Object?> get props => [
        description,
        mipr,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('GeneratedSchema')
      ..add(
        'description',
        description,
      )
      ..add(
        'mipr',
        mipr,
      );
    return helper.toString();
  }
}

class GeneratedSchemaRestJson1Serializer
    extends _i4.StructuredSmithySerializer<GeneratedSchema> {
  const GeneratedSchemaRestJson1Serializer() : super('GeneratedSchema');

  @override
  Iterable<Type> get types => const [
        GeneratedSchema,
        _$GeneratedSchema,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  GeneratedSchema deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GeneratedSchemaBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'description':
          result.description.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.SchemaDescription),
          ) as _i2.SchemaDescription));
        case 'mipr':
          result.mipr.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(_i3.SchemaDefinition),
          ) as _i3.SchemaDefinition));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    GeneratedSchema object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final GeneratedSchema(:description, :mipr) = object;
    result$.addAll([
      'description',
      serializers.serialize(
        description,
        specifiedType: const FullType(_i2.SchemaDescription),
      ),
      'mipr',
      serializers.serialize(
        mipr,
        specifiedType: const FullType(_i3.SchemaDefinition),
      ),
    ]);
    return result$;
  }
}
