// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.test_schema_matrix; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_description.dart'
    as _i4;
import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_dimension.dart'
    as _i3;
import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_collection/built_collection.dart' as _i5;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

part 'test_schema_matrix.g.dart';

abstract class TestSchemaMatrix
    with _i1.HttpInput<TestSchemaMatrix>, _i2.AWSEquatable<TestSchemaMatrix>
    implements Built<TestSchemaMatrix, TestSchemaMatrixBuilder> {
  factory TestSchemaMatrix({
    required List<_i3.SchemaDimension> dimensions,
    List<_i4.SchemaDescription>? include,
  }) {
    return _$TestSchemaMatrix._(
      dimensions: _i5.BuiltList(dimensions),
      include: include == null ? null : _i5.BuiltList(include),
    );
  }

  factory TestSchemaMatrix.build(
      [void Function(TestSchemaMatrixBuilder) updates]) = _$TestSchemaMatrix;

  const TestSchemaMatrix._();

  factory TestSchemaMatrix.fromRequest(
    TestSchemaMatrix payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      payload;

  static const List<_i1.SmithySerializer<TestSchemaMatrix>> serializers = [
    TestSchemaMatrixRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(TestSchemaMatrixBuilder b) {}

  /// The dimensions for which to generate the schema matrix
  _i5.BuiltList<_i3.SchemaDimension> get dimensions;

  /// Optional list of manually-written schema descriptions to include
  _i5.BuiltList<_i4.SchemaDescription>? get include;
  @override
  TestSchemaMatrix getPayload() => this;
  @override
  List<Object?> get props => [
        dimensions,
        include,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('TestSchemaMatrix')
      ..add(
        'dimensions',
        dimensions,
      )
      ..add(
        'include',
        include,
      );
    return helper.toString();
  }
}

class TestSchemaMatrixRestJson1Serializer
    extends _i1.StructuredSmithySerializer<TestSchemaMatrix> {
  const TestSchemaMatrixRestJson1Serializer() : super('TestSchemaMatrix');

  @override
  Iterable<Type> get types => const [
        TestSchemaMatrix,
        _$TestSchemaMatrix,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  TestSchemaMatrix deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TestSchemaMatrixBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'dimensions':
          result.dimensions.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(_i3.SchemaDimension)],
            ),
          ) as _i5.BuiltList<_i3.SchemaDimension>));
        case 'include':
          result.include.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i5.BuiltList,
              [FullType(_i4.SchemaDescription)],
            ),
          ) as _i5.BuiltList<_i4.SchemaDescription>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    TestSchemaMatrix object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final TestSchemaMatrix(:dimensions, :include) = object;
    result$.addAll([
      'dimensions',
      serializers.serialize(
        dimensions,
        specifiedType: const FullType(
          _i5.BuiltList,
          [FullType(_i3.SchemaDimension)],
        ),
      ),
    ]);
    if (include != null) {
      result$
        ..add('include')
        ..add(serializers.serialize(
          include,
          specifiedType: const FullType(
            _i5.BuiltList,
            [FullType(_i4.SchemaDescription)],
          ),
        ));
    }
    return result$;
  }
}
