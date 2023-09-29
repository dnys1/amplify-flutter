// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.untag_resource_response;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'untag_resource_response.g.dart';

abstract class UntagResourceResponse
    with _i1.AWSEquatable<UntagResourceResponse>
    implements
        Built<UntagResourceResponse, UntagResourceResponseBuilder>,
        _i2.EmptyPayload {
  factory UntagResourceResponse() {
    return _$UntagResourceResponse._();
  }

  factory UntagResourceResponse.build(
          [void Function(UntagResourceResponseBuilder) updates]) =
      _$UntagResourceResponse;

  const UntagResourceResponse._();

  /// Constructs a [UntagResourceResponse] from a [payload] and [response].
  factory UntagResourceResponse.fromResponse(
          UntagResourceResponse payload, _i1.AWSBaseHttpResponse response) =>
      payload;

  static const List<_i2.SmithySerializer> serializers = [
    _UntagResourceResponseRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(UntagResourceResponseBuilder b) {}
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('UntagResourceResponse');
    return helper.toString();
  }
}

class _UntagResourceResponseRestJson1Serializer
    extends _i2.StructuredSmithySerializer<UntagResourceResponse> {
  const _UntagResourceResponseRestJson1Serializer()
      : super('UntagResourceResponse');

  @override
  Iterable<Type> get types =>
      const [UntagResourceResponse, _$UntagResourceResponse];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  UntagResourceResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return UntagResourceResponseBuilder().build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
          {FullType specifiedType = FullType.unspecified}) =>
      const <Object?>[];
}
