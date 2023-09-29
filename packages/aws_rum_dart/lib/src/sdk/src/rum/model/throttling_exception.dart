// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.throttling_exception;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i3;
import 'package:smithy/smithy.dart' as _i2;

part 'throttling_exception.g.dart';

/// The request was throttled because of quota limits.
abstract class ThrottlingException
    with _i1.AWSEquatable<ThrottlingException>
    implements
        Built<ThrottlingException, ThrottlingExceptionBuilder>,
        _i2.HasPayload<ThrottlingExceptionPayload>,
        _i2.SmithyHttpException {
  /// The request was throttled because of quota limits.
  factory ThrottlingException(
      {required String message,
      String? quotaCode,
      int? retryAfterSeconds,
      String? serviceCode}) {
    return _$ThrottlingException._(
        message: message,
        quotaCode: quotaCode,
        retryAfterSeconds: retryAfterSeconds,
        serviceCode: serviceCode);
  }

  /// The request was throttled because of quota limits.
  factory ThrottlingException.build(
          [void Function(ThrottlingExceptionBuilder) updates]) =
      _$ThrottlingException;

  const ThrottlingException._();

  /// Constructs a [ThrottlingException] from a [payload] and [response].
  factory ThrottlingException.fromResponse(ThrottlingExceptionPayload payload,
          _i1.AWSBaseHttpResponse response) =>
      ThrottlingException.build((b) {
        b.message = payload.message;
        b.quotaCode = payload.quotaCode;
        b.serviceCode = payload.serviceCode;
        if (response.headers['Retry-After'] != null) {
          b.retryAfterSeconds = int.parse(response.headers['Retry-After']!);
        }
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    _ThrottlingExceptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ThrottlingExceptionBuilder b) {}
  @override
  String get message;

  /// The ID of the service quota that was exceeded.
  String? get quotaCode;

  /// The value of a parameter in the request caused an error.
  int? get retryAfterSeconds;

  /// The ID of the service that is associated with the error.
  String? get serviceCode;
  @override
  ThrottlingExceptionPayload getPayload() => ThrottlingExceptionPayload((b) {
        b.message = message;
        b.quotaCode = quotaCode;
        b.serviceCode = serviceCode;
      });
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
      namespace: 'com.amazonaws.rum', shape: 'ThrottlingException');
  @override
  _i2.RetryConfig? get retryConfig =>
      const _i2.RetryConfig(isThrottlingError: true);
  @override
  @BuiltValueField(compare: false)
  int get statusCode => 429;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props =>
      [message, quotaCode, retryAfterSeconds, serviceCode];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ThrottlingException');
    helper.add('message', message);
    helper.add('quotaCode', quotaCode);
    helper.add('retryAfterSeconds', retryAfterSeconds);
    helper.add('serviceCode', serviceCode);
    return helper.toString();
  }
}

@_i3.internal
abstract class ThrottlingExceptionPayload
    with _i1.AWSEquatable<ThrottlingExceptionPayload>
    implements
        Built<ThrottlingExceptionPayload, ThrottlingExceptionPayloadBuilder> {
  factory ThrottlingExceptionPayload(
          [void Function(ThrottlingExceptionPayloadBuilder) updates]) =
      _$ThrottlingExceptionPayload;

  const ThrottlingExceptionPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ThrottlingExceptionPayloadBuilder b) {}
  String get message;

  /// The ID of the service quota that was exceeded.
  String? get quotaCode;

  /// The ID of the service that is associated with the error.
  String? get serviceCode;
  @override
  List<Object?> get props => [message, quotaCode, serviceCode];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ThrottlingExceptionPayload');
    helper.add('message', message);
    helper.add('quotaCode', quotaCode);
    helper.add('serviceCode', serviceCode);
    return helper.toString();
  }
}

class _ThrottlingExceptionRestJson1Serializer
    extends _i2.StructuredSmithySerializer<ThrottlingExceptionPayload> {
  const _ThrottlingExceptionRestJson1Serializer()
      : super('ThrottlingException');

  @override
  Iterable<Type> get types => const [
        ThrottlingException,
        _$ThrottlingException,
        ThrottlingExceptionPayload,
        _$ThrottlingExceptionPayload
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  ThrottlingExceptionPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ThrottlingExceptionPayloadBuilder();
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
        case 'quotaCode':
          if (value != null) {
            result.quotaCode = (serializers.deserialize(value,
                specifiedType: const FullType(String)) as String);
          }
          break;
        case 'serviceCode':
          if (value != null) {
            result.serviceCode = (serializers.deserialize(value,
                specifiedType: const FullType(String)) as String);
          }
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
      {FullType specifiedType = FullType.unspecified}) {
    final payload = object is ThrottlingException
        ? object.getPayload()
        : (object as ThrottlingExceptionPayload);
    final result = <Object?>[
      'message',
      serializers.serialize(payload.message,
          specifiedType: const FullType(String))
    ];
    if (payload.quotaCode != null) {
      result
        ..add('quotaCode')
        ..add(serializers.serialize(payload.quotaCode!,
            specifiedType: const FullType(String)));
    }
    if (payload.serviceCode != null) {
      result
        ..add('serviceCode')
        ..add(serializers.serialize(payload.serviceCode!,
            specifiedType: const FullType(String)));
    }
    return result;
  }
}
