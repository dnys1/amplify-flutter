// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.internal_server_exception;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i3;
import 'package:smithy/smithy.dart' as _i2;

part 'internal_server_exception.g.dart';

/// Internal service exception.
abstract class InternalServerException
    with _i1.AWSEquatable<InternalServerException>
    implements
        Built<InternalServerException, InternalServerExceptionBuilder>,
        _i2.HasPayload<InternalServerExceptionPayload>,
        _i2.SmithyHttpException {
  /// Internal service exception.
  factory InternalServerException(
      {required String message, int? retryAfterSeconds}) {
    return _$InternalServerException._(
        message: message, retryAfterSeconds: retryAfterSeconds);
  }

  /// Internal service exception.
  factory InternalServerException.build(
          [void Function(InternalServerExceptionBuilder) updates]) =
      _$InternalServerException;

  const InternalServerException._();

  /// Constructs a [InternalServerException] from a [payload] and [response].
  factory InternalServerException.fromResponse(
          InternalServerExceptionPayload payload,
          _i1.AWSBaseHttpResponse response) =>
      InternalServerException.build((b) {
        b.message = payload.message;
        if (response.headers['Retry-After'] != null) {
          b.retryAfterSeconds = int.parse(response.headers['Retry-After']!);
        }
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    _InternalServerExceptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(InternalServerExceptionBuilder b) {}
  @override
  String get message;

  /// The value of a parameter in the request caused an error.
  int? get retryAfterSeconds;
  @override
  InternalServerExceptionPayload getPayload() =>
      InternalServerExceptionPayload((b) {
        b.message = message;
      });
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
      namespace: 'com.amazonaws.rum', shape: 'InternalServerException');
  @override
  _i2.RetryConfig? get retryConfig =>
      const _i2.RetryConfig(isThrottlingError: false);
  @override
  @BuiltValueField(compare: false)
  int get statusCode => 500;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [message, retryAfterSeconds];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('InternalServerException');
    helper.add('message', message);
    helper.add('retryAfterSeconds', retryAfterSeconds);
    return helper.toString();
  }
}

@_i3.internal
abstract class InternalServerExceptionPayload
    with
        _i1.AWSEquatable<InternalServerExceptionPayload>
    implements
        Built<InternalServerExceptionPayload,
            InternalServerExceptionPayloadBuilder> {
  factory InternalServerExceptionPayload(
          [void Function(InternalServerExceptionPayloadBuilder) updates]) =
      _$InternalServerExceptionPayload;

  const InternalServerExceptionPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(InternalServerExceptionPayloadBuilder b) {}
  String get message;
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    final helper =
        newBuiltValueToStringHelper('InternalServerExceptionPayload');
    helper.add('message', message);
    return helper.toString();
  }
}

class _InternalServerExceptionRestJson1Serializer
    extends _i2.StructuredSmithySerializer<InternalServerExceptionPayload> {
  const _InternalServerExceptionRestJson1Serializer()
      : super('InternalServerException');

  @override
  Iterable<Type> get types => const [
        InternalServerException,
        _$InternalServerException,
        InternalServerExceptionPayload,
        _$InternalServerExceptionPayload
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  InternalServerExceptionPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = InternalServerExceptionPayloadBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'message':
          result.message = (serializers.deserialize(value!,
              specifiedType: const FullType(String)) as String);
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
      {FullType specifiedType = FullType.unspecified}) {
    final payload = object is InternalServerException
        ? object.getPayload()
        : (object as InternalServerExceptionPayload);
    final result = <Object?>[
      'message',
      serializers.serialize(payload.message,
          specifiedType: const FullType(String))
    ];
    return result;
  }
}
