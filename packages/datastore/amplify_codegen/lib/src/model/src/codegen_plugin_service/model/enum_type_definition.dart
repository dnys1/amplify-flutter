// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.enum_type_definition; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'enum_type_definition.g.dart';

abstract class EnumTypeDefinition
    with _i1.AWSEquatable<EnumTypeDefinition>
    implements Built<EnumTypeDefinition, EnumTypeDefinitionBuilder> {
  factory EnumTypeDefinition({
    required String name,
    required List<String> values,
  }) {
    return _$EnumTypeDefinition._(
      name: name,
      values: _i2.BuiltList(values),
    );
  }

  factory EnumTypeDefinition.build(
          [void Function(EnumTypeDefinitionBuilder) updates]) =
      _$EnumTypeDefinition;

  const EnumTypeDefinition._();

  static const List<_i3.SmithySerializer> serializers = [
    EnumTypeDefinitionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(EnumTypeDefinitionBuilder b) {}
  String get name;
  _i2.BuiltList<String> get values;
  @override
  List<Object?> get props => [
        name,
        values,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('EnumTypeDefinition');
    helper.add(
      'name',
      name,
    );
    helper.add(
      'values',
      values,
    );
    return helper.toString();
  }
}

class EnumTypeDefinitionRestJson1Serializer
    extends _i3.StructuredSmithySerializer<EnumTypeDefinition> {
  const EnumTypeDefinitionRestJson1Serializer() : super('EnumTypeDefinition');

  @override
  Iterable<Type> get types => const [
        EnumTypeDefinition,
        _$EnumTypeDefinition,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  EnumTypeDefinition deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EnumTypeDefinitionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'name':
          result.name = (serializers.deserialize(
            value!,
            specifiedType: const FullType(String),
          ) as String);
          break;
        case 'values':
          result.values.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(String)],
            ),
          ) as _i2.BuiltList<String>));
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
    final payload = (object as EnumTypeDefinition);
    final result = <Object?>[
      'name',
      serializers.serialize(
        payload.name,
        specifiedType: const FullType(String),
      ),
      'values',
      serializers.serialize(
        payload.values,
        specifiedType: const FullType(
          _i2.BuiltList,
          [FullType(String)],
        ),
      ),
    ];
    return result;
  }
}
