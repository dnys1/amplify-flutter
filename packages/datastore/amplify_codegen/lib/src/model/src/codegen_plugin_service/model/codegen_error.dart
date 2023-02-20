// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.codegen_error; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'codegen_error.g.dart';

abstract class CodegenError
    with _i1.AWSEquatable<CodegenError>
    implements
        Built<CodegenError, CodegenErrorBuilder>,
        _i2.SmithyHttpException {
  factory CodegenError({String? message}) {
    return _$CodegenError._(message: message);
  }

  factory CodegenError.build([void Function(CodegenErrorBuilder) updates]) =
      _$CodegenError;

  const CodegenError._();

  /// Constructs a [CodegenError] from a [payload] and [response].
  factory CodegenError.fromResponse(
    CodegenError payload,
    _i1.AWSBaseHttpResponse response,
  ) =>
      payload.rebuild((b) {
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    CodegenErrorRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(CodegenErrorBuilder b) {}
  @override
  String? get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
        namespace: 'com.amazonaws.amplify.codegen',
        shape: 'CodegenError',
      );
  @override
  _i2.RetryConfig? get retryConfig => null;
  @override
  @BuiltValueField(compare: false)
  int get statusCode => 500;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('CodegenError');
    helper.add(
      'message',
      message,
    );
    return helper.toString();
  }
}

class CodegenErrorRestJson1Serializer
    extends _i2.StructuredSmithySerializer<CodegenError> {
  const CodegenErrorRestJson1Serializer() : super('CodegenError');

  @override
  Iterable<Type> get types => const [
        CodegenError,
        _$CodegenError,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ];
  @override
  CodegenError deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CodegenErrorBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'message':
          if (value != null) {
            result.message = (serializers.deserialize(
              value,
              specifiedType: const FullType(String),
            ) as String);
          }
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
    final payload = (object as CodegenError);
    final result = <Object?>[];
    if (payload.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(
          payload.message!,
          specifiedType: const FullType(String),
        ));
    }
    return result;
  }
}
