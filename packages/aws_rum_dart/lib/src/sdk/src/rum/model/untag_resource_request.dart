// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.untag_resource_request;

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i4;
import 'package:smithy/smithy.dart' as _i1;

part 'untag_resource_request.g.dart';

abstract class UntagResourceRequest
    with
        _i1.HttpInput<UntagResourceRequestPayload>,
        _i2.AWSEquatable<UntagResourceRequest>
    implements
        Built<UntagResourceRequest, UntagResourceRequestBuilder>,
        _i1.EmptyPayload,
        _i1.HasPayload<UntagResourceRequestPayload> {
  factory UntagResourceRequest(
      {required String resourceArn, required _i3.BuiltList<String> tagKeys}) {
    return _$UntagResourceRequest._(resourceArn: resourceArn, tagKeys: tagKeys);
  }

  factory UntagResourceRequest.build(
          [void Function(UntagResourceRequestBuilder) updates]) =
      _$UntagResourceRequest;

  const UntagResourceRequest._();

  factory UntagResourceRequest.fromRequest(
          UntagResourceRequestPayload payload, _i2.AWSBaseHttpRequest request,
          {Map<String, String> labels = const {}}) =>
      UntagResourceRequest.build((b) {
        if (request.queryParameters['tagKeys'] != null) {
          b.tagKeys.addAll(_i1
              .parseHeader(request.queryParameters['tagKeys']!)
              .map((el) => el.trim()));
        }
        if (labels['resourceArn'] != null) {
          b.resourceArn = labels['resourceArn']!;
        }
      });

  static const List<_i1.SmithySerializer> serializers = [
    _UntagResourceRequestRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(UntagResourceRequestBuilder b) {}

  /// The ARN of the CloudWatch RUM resource that you're removing tags from.
  String get resourceArn;

  /// The list of tag keys to remove from the resource.
  _i3.BuiltList<String> get tagKeys;
  @override
  String labelFor(String key) {
    switch (key) {
      case 'ResourceArn':
        return resourceArn;
    }
    throw _i1.MissingLabelException(this, key);
  }

  @override
  UntagResourceRequestPayload getPayload() => UntagResourceRequestPayload();
  @override
  List<Object?> get props => [resourceArn, tagKeys];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('UntagResourceRequest');
    helper.add('resourceArn', resourceArn);
    helper.add('tagKeys', tagKeys);
    return helper.toString();
  }
}

@_i4.internal
abstract class UntagResourceRequestPayload
    with _i2.AWSEquatable<UntagResourceRequestPayload>
    implements
        Built<UntagResourceRequestPayload, UntagResourceRequestPayloadBuilder>,
        _i1.EmptyPayload {
  factory UntagResourceRequestPayload(
          [void Function(UntagResourceRequestPayloadBuilder) updates]) =
      _$UntagResourceRequestPayload;

  const UntagResourceRequestPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(UntagResourceRequestPayloadBuilder b) {}
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('UntagResourceRequestPayload');
    return helper.toString();
  }
}

class _UntagResourceRequestRestJson1Serializer
    extends _i1.StructuredSmithySerializer<UntagResourceRequestPayload> {
  const _UntagResourceRequestRestJson1Serializer()
      : super('UntagResourceRequest');

  @override
  Iterable<Type> get types => const [
        UntagResourceRequest,
        _$UntagResourceRequest,
        UntagResourceRequestPayload,
        _$UntagResourceRequestPayload
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols =>
      const [_i1.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  UntagResourceRequestPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return UntagResourceRequestPayloadBuilder().build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
          {FullType specifiedType = FullType.unspecified}) =>
      const <Object?>[];
}
