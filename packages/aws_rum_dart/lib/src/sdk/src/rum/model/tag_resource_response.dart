// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.tag_resource_response;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'tag_resource_response.g.dart';

abstract class TagResourceResponse
    with _i1.AWSEquatable<TagResourceResponse>
    implements
        Built<TagResourceResponse, TagResourceResponseBuilder>,
        _i2.EmptyPayload {
  factory TagResourceResponse() {
    return _$TagResourceResponse._();
  }

  factory TagResourceResponse.build(
          [void Function(TagResourceResponseBuilder) updates]) =
      _$TagResourceResponse;

  const TagResourceResponse._();

  /// Constructs a [TagResourceResponse] from a [payload] and [response].
  factory TagResourceResponse.fromResponse(
          TagResourceResponse payload, _i1.AWSBaseHttpResponse response) =>
      payload;

  static const List<_i2.SmithySerializer> serializers = [
    _TagResourceResponseRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(TagResourceResponseBuilder b) {}
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('TagResourceResponse');
    return helper.toString();
  }
}

class _TagResourceResponseRestJson1Serializer
    extends _i2.StructuredSmithySerializer<TagResourceResponse> {
  const _TagResourceResponseRestJson1Serializer()
      : super('TagResourceResponse');

  @override
  Iterable<Type> get types =>
      const [TagResourceResponse, _$TagResourceResponse];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  TagResourceResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return TagResourceResponseBuilder().build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
          {FullType specifiedType = FullType.unspecified}) =>
      const <Object?>[];
}
