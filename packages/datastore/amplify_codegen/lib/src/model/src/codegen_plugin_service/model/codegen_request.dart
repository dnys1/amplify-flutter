// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names

library amplify_codegen.codegen_plugin_service.model.codegen_request; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_codegen/src/model/src/codegen_plugin_service/model/schema_definition.dart'
    as _i3;
import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

part 'codegen_request.g.dart';

abstract class CodegenRequest
    with _i1.HttpInput<CodegenRequest>, _i2.AWSEquatable<CodegenRequest>
    implements Built<CodegenRequest, CodegenRequestBuilder> {
  factory CodegenRequest({
    required String projectRoot,
    required _i3.SchemaDefinition schemaDefinition,
  }) {
    return _$CodegenRequest._(
      projectRoot: projectRoot,
      schemaDefinition: schemaDefinition,
    );
  }

  factory CodegenRequest.build([void Function(CodegenRequestBuilder) updates]) =
      _$CodegenRequest;

  const CodegenRequest._();

  factory CodegenRequest.fromRequest(
    CodegenRequest payload,
    _i2.AWSBaseHttpRequest request, {
    Map<String, String> labels = const {},
  }) =>
      payload;

  static const List<_i1.SmithySerializer<CodegenRequest>> serializers = [
    CodegenRequestRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(CodegenRequestBuilder b) {}

  /// The path to the project root
  String get projectRoot;

  /// All type definitions in the schema.
  _i3.SchemaDefinition get schemaDefinition;
  @override
  CodegenRequest getPayload() => this;
  @override
  List<Object?> get props => [
        projectRoot,
        schemaDefinition,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('CodegenRequest')
      ..add(
        'projectRoot',
        projectRoot,
      )
      ..add(
        'schemaDefinition',
        schemaDefinition,
      );
    return helper.toString();
  }
}

class CodegenRequestRestJson1Serializer
    extends _i1.StructuredSmithySerializer<CodegenRequest> {
  const CodegenRequestRestJson1Serializer() : super('CodegenRequest');

  @override
  Iterable<Type> get types => const [
        CodegenRequest,
        _$CodegenRequest,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  CodegenRequest deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodegenRequestBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'projectRoot':
          result.projectRoot = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'schemaDefinition':
          result.schemaDefinition.replace((serializers.deserialize(
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
    CodegenRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final CodegenRequest(:projectRoot, :schemaDefinition) = object;
    result$.addAll([
      'projectRoot',
      serializers.serialize(
        projectRoot,
        specifiedType: const FullType(String),
      ),
      'schemaDefinition',
      serializers.serialize(
        schemaDefinition,
        specifiedType: const FullType(_i3.SchemaDefinition),
      ),
    ]);
    return result$;
  }
}
