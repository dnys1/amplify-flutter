// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.access_denied_exception;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'access_denied_exception.g.dart';

/// You don't have sufficient permissions to perform this action.
abstract class AccessDeniedException
    with _i1.AWSEquatable<AccessDeniedException>
    implements
        Built<AccessDeniedException, AccessDeniedExceptionBuilder>,
        _i2.SmithyHttpException {
  /// You don't have sufficient permissions to perform this action.
  factory AccessDeniedException({required String message}) {
    return _$AccessDeniedException._(message: message);
  }

  /// You don't have sufficient permissions to perform this action.
  factory AccessDeniedException.build(
          [void Function(AccessDeniedExceptionBuilder) updates]) =
      _$AccessDeniedException;

  const AccessDeniedException._();

  /// Constructs a [AccessDeniedException] from a [payload] and [response].
  factory AccessDeniedException.fromResponse(
          AccessDeniedException payload, _i1.AWSBaseHttpResponse response) =>
      payload.rebuild((b) {
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    _AccessDeniedExceptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(AccessDeniedExceptionBuilder b) {}
  @override
  String get message;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
      namespace: 'com.amazonaws.rum', shape: 'AccessDeniedException');
  @override
  _i2.RetryConfig? get retryConfig => null;
  @override
  @BuiltValueField(compare: false)
  int get statusCode => 403;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [message];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AccessDeniedException');
    helper.add('message', message);
    return helper.toString();
  }
}

class _AccessDeniedExceptionRestJson1Serializer
    extends _i2.StructuredSmithySerializer<AccessDeniedException> {
  const _AccessDeniedExceptionRestJson1Serializer()
      : super('AccessDeniedException');

  @override
  Iterable<Type> get types =>
      const [AccessDeniedException, _$AccessDeniedException];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  AccessDeniedException deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AccessDeniedExceptionBuilder();
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
    final payload = (object as AccessDeniedException);
    final result = <Object?>[
      'message',
      serializers.serialize(payload.message,
          specifiedType: const FullType(String))
    ];
    return result;
  }
}
