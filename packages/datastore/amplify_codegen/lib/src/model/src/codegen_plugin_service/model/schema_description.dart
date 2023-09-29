// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.schema_description; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/globals.dart'
    as _i2;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/type_description.dart'
    as _i3;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i4;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i5;

part 'schema_description.g.dart';

abstract class SchemaDescription
    with _i1.AWSEquatable<SchemaDescription>
    implements Built<SchemaDescription, SchemaDescriptionBuilder> {
  factory SchemaDescription({
    required String name,
    _i2.Globals? globals,
    required List<_i3.TypeDescription> types,
  }) {
    return _$SchemaDescription._(
      name: name,
      globals: globals,
      types: _i4.BuiltList(types),
    );
  }

  factory SchemaDescription.build(
      [void Function(SchemaDescriptionBuilder) updates]) = _$SchemaDescription;

  const SchemaDescription._();

  static const List<_i5.SmithySerializer<SchemaDescription>> serializers = [
    SchemaDescriptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(SchemaDescriptionBuilder b) {}

  /// A unique name for the schema (generated based on dimensions if not provided)
  String get name;
  _i2.Globals? get globals;
  _i4.BuiltList<_i3.TypeDescription> get types;
  @override
  List<Object?> get props => [
        name,
        globals,
        types,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('SchemaDescription')
      ..add(
        'name',
        name,
      )
      ..add(
        'globals',
        globals,
      )
      ..add(
        'types',
        types,
      );
    return helper.toString();
  }
}

class SchemaDescriptionRestJson1Serializer
    extends _i5.StructuredSmithySerializer<SchemaDescription> {
  const SchemaDescriptionRestJson1Serializer() : super('SchemaDescription');

  @override
  Iterable<Type> get types => const [
        SchemaDescription,
        _$SchemaDescription,
      ];
  @override
  Iterable<_i5.ShapeId> get supportedProtocols => const [
        _i5.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  SchemaDescription deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SchemaDescriptionBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'globals':
          result.globals.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(_i2.Globals),
          ) as _i2.Globals));
        case 'name':
          result.name = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'types':
          result.types.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i4.BuiltList,
              [FullType(_i3.TypeDescription)],
            ),
          ) as _i4.BuiltList<_i3.TypeDescription>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    SchemaDescription object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final SchemaDescription(:globals, :name, :types) = object;
    result$.addAll([
      'name',
      serializers.serialize(
        name,
        specifiedType: const FullType(String),
      ),
      'types',
      serializers.serialize(
        types,
        specifiedType: const FullType(
          _i4.BuiltList,
          [FullType(_i3.TypeDescription)],
        ),
      ),
    ]);
    if (globals != null) {
      result$
        ..add('globals')
        ..add(serializers.serialize(
          globals,
          specifiedType: const FullType(_i2.Globals),
        ));
    }
    return result$;
  }
}
