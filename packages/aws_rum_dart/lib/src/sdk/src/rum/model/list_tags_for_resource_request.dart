// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.list_tags_for_resource_request;

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i3;
import 'package:smithy/smithy.dart' as _i1;

part 'list_tags_for_resource_request.g.dart';

abstract class ListTagsForResourceRequest
    with
        _i1.HttpInput<ListTagsForResourceRequestPayload>,
        _i2.AWSEquatable<ListTagsForResourceRequest>
    implements
        Built<ListTagsForResourceRequest, ListTagsForResourceRequestBuilder>,
        _i1.EmptyPayload,
        _i1.HasPayload<ListTagsForResourceRequestPayload> {
  factory ListTagsForResourceRequest({required String resourceArn}) {
    return _$ListTagsForResourceRequest._(resourceArn: resourceArn);
  }

  factory ListTagsForResourceRequest.build(
          [void Function(ListTagsForResourceRequestBuilder) updates]) =
      _$ListTagsForResourceRequest;

  const ListTagsForResourceRequest._();

  factory ListTagsForResourceRequest.fromRequest(
          ListTagsForResourceRequestPayload payload,
          _i2.AWSBaseHttpRequest request,
          {Map<String, String> labels = const {}}) =>
      ListTagsForResourceRequest.build((b) {
        if (labels['resourceArn'] != null) {
          b.resourceArn = labels['resourceArn']!;
        }
      });

  static const List<_i1.SmithySerializer> serializers = [
    _ListTagsForResourceRequestRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ListTagsForResourceRequestBuilder b) {}

  /// The ARN of the resource that you want to see the tags of.
  String get resourceArn;
  @override
  String labelFor(String key) {
    switch (key) {
      case 'ResourceArn':
        return resourceArn;
    }
    throw _i1.MissingLabelException(this, key);
  }

  @override
  ListTagsForResourceRequestPayload getPayload() =>
      ListTagsForResourceRequestPayload();
  @override
  List<Object?> get props => [resourceArn];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ListTagsForResourceRequest');
    helper.add('resourceArn', resourceArn);
    return helper.toString();
  }
}

@_i3.internal
abstract class ListTagsForResourceRequestPayload
    with
        _i2.AWSEquatable<ListTagsForResourceRequestPayload>
    implements
        Built<ListTagsForResourceRequestPayload,
            ListTagsForResourceRequestPayloadBuilder>,
        _i1.EmptyPayload {
  factory ListTagsForResourceRequestPayload(
          [void Function(ListTagsForResourceRequestPayloadBuilder) updates]) =
      _$ListTagsForResourceRequestPayload;

  const ListTagsForResourceRequestPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ListTagsForResourceRequestPayloadBuilder b) {}
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    final helper =
        newBuiltValueToStringHelper('ListTagsForResourceRequestPayload');
    return helper.toString();
  }
}

class _ListTagsForResourceRequestRestJson1Serializer
    extends _i1.StructuredSmithySerializer<ListTagsForResourceRequestPayload> {
  const _ListTagsForResourceRequestRestJson1Serializer()
      : super('ListTagsForResourceRequest');

  @override
  Iterable<Type> get types => const [
        ListTagsForResourceRequest,
        _$ListTagsForResourceRequest,
        ListTagsForResourceRequestPayload,
        _$ListTagsForResourceRequestPayload
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols =>
      const [_i1.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  ListTagsForResourceRequestPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return ListTagsForResourceRequestPayloadBuilder().build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
          {FullType specifiedType = FullType.unspecified}) =>
      const <Object?>[];
}
