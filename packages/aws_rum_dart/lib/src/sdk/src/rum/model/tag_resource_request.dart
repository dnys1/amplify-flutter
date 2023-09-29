// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.tag_resource_request;

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:built_collection/built_collection.dart' as _i3;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i4;
import 'package:smithy/smithy.dart' as _i1;

part 'tag_resource_request.g.dart';

abstract class TagResourceRequest
    with
        _i1.HttpInput<TagResourceRequestPayload>,
        _i2.AWSEquatable<TagResourceRequest>
    implements
        Built<TagResourceRequest, TagResourceRequestBuilder>,
        _i1.HasPayload<TagResourceRequestPayload> {
  factory TagResourceRequest(
      {required String resourceArn,
      required _i3.BuiltMap<String, String> tags}) {
    return _$TagResourceRequest._(resourceArn: resourceArn, tags: tags);
  }

  factory TagResourceRequest.build(
          [void Function(TagResourceRequestBuilder) updates]) =
      _$TagResourceRequest;

  const TagResourceRequest._();

  factory TagResourceRequest.fromRequest(
          TagResourceRequestPayload payload, _i2.AWSBaseHttpRequest request,
          {Map<String, String> labels = const {}}) =>
      TagResourceRequest.build((b) {
        b.tags.replace(payload.tags);
        if (labels['resourceArn'] != null) {
          b.resourceArn = labels['resourceArn']!;
        }
      });

  static const List<_i1.SmithySerializer> serializers = [
    _TagResourceRequestRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(TagResourceRequestBuilder b) {}

  /// The ARN of the CloudWatch RUM resource that you're adding tags to.
  String get resourceArn;

  /// The list of key-value pairs to associate with the resource.
  _i3.BuiltMap<String, String> get tags;
  @override
  String labelFor(String key) {
    switch (key) {
      case 'ResourceArn':
        return resourceArn;
    }
    throw _i1.MissingLabelException(this, key);
  }

  @override
  TagResourceRequestPayload getPayload() => TagResourceRequestPayload((b) {
        b.tags.replace(tags);
      });
  @override
  List<Object?> get props => [resourceArn, tags];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('TagResourceRequest');
    helper.add('resourceArn', resourceArn);
    helper.add('tags', tags);
    return helper.toString();
  }
}

@_i4.internal
abstract class TagResourceRequestPayload
    with _i2.AWSEquatable<TagResourceRequestPayload>
    implements
        Built<TagResourceRequestPayload, TagResourceRequestPayloadBuilder> {
  factory TagResourceRequestPayload(
          [void Function(TagResourceRequestPayloadBuilder) updates]) =
      _$TagResourceRequestPayload;

  const TagResourceRequestPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(TagResourceRequestPayloadBuilder b) {}

  /// The list of key-value pairs to associate with the resource.
  _i3.BuiltMap<String, String> get tags;
  @override
  List<Object?> get props => [tags];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('TagResourceRequestPayload');
    helper.add('tags', tags);
    return helper.toString();
  }
}

class _TagResourceRequestRestJson1Serializer
    extends _i1.StructuredSmithySerializer<TagResourceRequestPayload> {
  const _TagResourceRequestRestJson1Serializer() : super('TagResourceRequest');

  @override
  Iterable<Type> get types => const [
        TagResourceRequest,
        _$TagResourceRequest,
        TagResourceRequestPayload,
        _$TagResourceRequestPayload
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols =>
      const [_i1.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  TagResourceRequestPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = TagResourceRequestPayloadBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'Tags':
          result.tags.replace((serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i3.BuiltMap, [FullType(String), FullType(String)]))
              as _i3.BuiltMap<String, String>));
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
      {FullType specifiedType = FullType.unspecified}) {
    final payload = object is TagResourceRequest
        ? object.getPayload()
        : (object as TagResourceRequestPayload);
    final result = <Object?>[
      'Tags',
      serializers.serialize(payload.tags,
          specifiedType: const FullType(
              _i3.BuiltMap, [FullType(String), FullType(String)]))
    ];
    return result;
  }
}
