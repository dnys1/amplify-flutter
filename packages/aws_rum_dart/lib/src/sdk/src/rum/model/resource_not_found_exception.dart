// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.resource_not_found_exception;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'resource_not_found_exception.g.dart';

/// Resource not found.
abstract class ResourceNotFoundException
    with _i1.AWSEquatable<ResourceNotFoundException>
    implements
        Built<ResourceNotFoundException, ResourceNotFoundExceptionBuilder>,
        _i2.SmithyHttpException {
  /// Resource not found.
  factory ResourceNotFoundException(
      {required String message,
      required String resourceName,
      String? resourceType}) {
    return _$ResourceNotFoundException._(
        message: message,
        resourceName: resourceName,
        resourceType: resourceType);
  }

  /// Resource not found.
  factory ResourceNotFoundException.build(
          [void Function(ResourceNotFoundExceptionBuilder) updates]) =
      _$ResourceNotFoundException;

  const ResourceNotFoundException._();

  /// Constructs a [ResourceNotFoundException] from a [payload] and [response].
  factory ResourceNotFoundException.fromResponse(
          ResourceNotFoundException payload,
          _i1.AWSBaseHttpResponse response) =>
      payload.rebuild((b) {
        b.headers = response.headers;
      });

  static const List<_i2.SmithySerializer> serializers = [
    _ResourceNotFoundExceptionRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ResourceNotFoundExceptionBuilder b) {}
  @override
  String get message;

  /// The name of the resource that is associated with the error.
  String get resourceName;

  /// The type of the resource that is associated with the error.
  String? get resourceType;
  @override
  _i2.ShapeId get shapeId => const _i2.ShapeId(
      namespace: 'com.amazonaws.rum', shape: 'ResourceNotFoundException');
  @override
  _i2.RetryConfig? get retryConfig => null;
  @override
  @BuiltValueField(compare: false)
  int get statusCode => 404;
  @override
  @BuiltValueField(compare: false)
  Map<String, String>? get headers;
  @override
  Exception? get underlyingException => null;
  @override
  List<Object?> get props => [message, resourceName, resourceType];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ResourceNotFoundException');
    helper.add('message', message);
    helper.add('resourceName', resourceName);
    helper.add('resourceType', resourceType);
    return helper.toString();
  }
}

class _ResourceNotFoundExceptionRestJson1Serializer
    extends _i2.StructuredSmithySerializer<ResourceNotFoundException> {
  const _ResourceNotFoundExceptionRestJson1Serializer()
      : super('ResourceNotFoundException');

  @override
  Iterable<Type> get types =>
      const [ResourceNotFoundException, _$ResourceNotFoundException];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  ResourceNotFoundException deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ResourceNotFoundExceptionBuilder();
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
        case 'resourceName':
          result.resourceName = (serializers.deserialize(value!,
              specifiedType: const FullType(String)) as String);
          break;
        case 'resourceType':
          if (value != null) {
            result.resourceType = (serializers.deserialize(value,
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
    final payload = (object as ResourceNotFoundException);
    final result = <Object?>[
      'message',
      serializers.serialize(payload.message,
          specifiedType: const FullType(String)),
      'resourceName',
      serializers.serialize(payload.resourceName,
          specifiedType: const FullType(String))
    ];
    if (payload.resourceType != null) {
      result
        ..add('resourceType')
        ..add(serializers.serialize(payload.resourceType!,
            specifiedType: const FullType(String)));
    }
    return result;
  }
}
