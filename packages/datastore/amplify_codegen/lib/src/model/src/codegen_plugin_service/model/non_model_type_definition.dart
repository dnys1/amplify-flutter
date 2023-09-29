// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.non_model_type_definition; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/model_field.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;

part 'non_model_type_definition.g.dart';

abstract class NonModelTypeDefinition
    with _i1.AWSEquatable<NonModelTypeDefinition>
    implements Built<NonModelTypeDefinition, NonModelTypeDefinitionBuilder> {
  factory NonModelTypeDefinition({
    required String name,
    required Map<String, _i2.ModelField> fields,
  }) {
    return _$NonModelTypeDefinition._(
      name: name,
      fields: _i3.BuiltMap(fields),
    );
  }

  factory NonModelTypeDefinition.build(
          [void Function(NonModelTypeDefinitionBuilder) updates]) =
      _$NonModelTypeDefinition;

  const NonModelTypeDefinition._();

  static const List<_i4.SmithySerializer<NonModelTypeDefinition>> serializers =
      [NonModelTypeDefinitionRestJson1Serializer()];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(NonModelTypeDefinitionBuilder b) {}
  String get name;
  _i3.BuiltMap<String, _i2.ModelField> get fields;
  @override
  List<Object?> get props => [
        name,
        fields,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('NonModelTypeDefinition')
      ..add(
        'name',
        name,
      )
      ..add(
        'fields',
        fields,
      );
    return helper.toString();
  }
}

class NonModelTypeDefinitionRestJson1Serializer
    extends _i4.StructuredSmithySerializer<NonModelTypeDefinition> {
  const NonModelTypeDefinitionRestJson1Serializer()
      : super('NonModelTypeDefinition');

  @override
  Iterable<Type> get types => const [
        NonModelTypeDefinition,
        _$NonModelTypeDefinition,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  NonModelTypeDefinition deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NonModelTypeDefinitionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'fields':
          result.fields.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltMap,
              [
                FullType(String),
                FullType(_i2.ModelField),
              ],
            ),
          ) as _i3.BuiltMap<String, _i2.ModelField>));
        case 'name':
          result.name = (serializers.deserialize(
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
    NonModelTypeDefinition object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final NonModelTypeDefinition(:fields, :name) = object;
    result$.addAll([
      'fields',
      serializers.serialize(
        fields,
        specifiedType: const FullType(
          _i3.BuiltMap,
          [
            FullType(String),
            FullType(_i2.ModelField),
          ],
        ),
      ),
      'name',
      serializers.serialize(
        name,
        specifiedType: const FullType(String),
      ),
    ]);
    return result$;
  }
}
