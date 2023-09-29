// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.test_schemas; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/generated_schema.dart'
    as _i2;
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;

part 'test_schemas.g.dart';

abstract class TestSchemas
    with _i1.AWSEquatable<TestSchemas>
    implements Built<TestSchemas, TestSchemasBuilder> {
  factory TestSchemas({required List<_i2.GeneratedSchema> generatedSchemas}) {
    return _$TestSchemas._(generatedSchemas: _i3.BuiltList(generatedSchemas));
  }

  factory TestSchemas.build([void Function(TestSchemasBuilder) updates]) =
      _$TestSchemas;

  const TestSchemas._();

  /// Constructs a [TestSchemas] from a [payload] and [response].
  factory TestSchemas.fromResponse(
    TestSchemas payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload;

  static const List<_i4.SmithySerializer<TestSchemas>> serializers = [
    TestSchemasRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(TestSchemasBuilder b) {}
  _i3.BuiltList<_i2.GeneratedSchema> get generatedSchemas;
  @override
  List<Object?> get props => [generatedSchemas];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('TestSchemas')
      ..add(
        'generatedSchemas',
        generatedSchemas,
      );
    return helper.toString();
  }
}

class TestSchemasRestJson1Serializer
    extends _i4.StructuredSmithySerializer<TestSchemas> {
  const TestSchemasRestJson1Serializer() : super('TestSchemas');

  @override
  Iterable<Type> get types => const [
        TestSchemas,
        _$TestSchemas,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  TestSchemas deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestSchemasBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'generatedSchemas':
          result.generatedSchemas.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i3.BuiltList,
              [FullType(_i2.GeneratedSchema)],
            ),
          ) as _i3.BuiltList<_i2.GeneratedSchema>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    TestSchemas object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final TestSchemas(:generatedSchemas) = object;
    result$.addAll([
      'generatedSchemas',
      serializers.serialize(
        generatedSchemas,
        specifiedType: const FullType(
          _i3.BuiltList,
          [FullType(_i2.GeneratedSchema)],
        ),
      ),
    ]);
    return result$;
  }
}
