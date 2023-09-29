// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.list_tags_for_resource_response;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'list_tags_for_resource_response.g.dart';

abstract class ListTagsForResourceResponse
    with _i1.AWSEquatable<ListTagsForResourceResponse>
    implements
        Built<ListTagsForResourceResponse, ListTagsForResourceResponseBuilder> {
  factory ListTagsForResourceResponse(
      {required String resourceArn,
      required _i2.BuiltMap<String, String> tags}) {
    return _$ListTagsForResourceResponse._(
        resourceArn: resourceArn, tags: tags);
  }

  factory ListTagsForResourceResponse.build(
          [void Function(ListTagsForResourceResponseBuilder) updates]) =
      _$ListTagsForResourceResponse;

  const ListTagsForResourceResponse._();

  /// Constructs a [ListTagsForResourceResponse] from a [payload] and [response].
  factory ListTagsForResourceResponse.fromResponse(
          ListTagsForResourceResponse payload,
          _i1.AWSBaseHttpResponse response) =>
      payload;

  static const List<_i3.SmithySerializer> serializers = [
    _ListTagsForResourceResponseRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ListTagsForResourceResponseBuilder b) {}

  /// The ARN of the resource that you are viewing.
  String get resourceArn;

  /// The list of tag keys and values associated with the resource you specified.
  _i2.BuiltMap<String, String> get tags;
  @override
  List<Object?> get props => [resourceArn, tags];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ListTagsForResourceResponse');
    helper.add('resourceArn', resourceArn);
    helper.add('tags', tags);
    return helper.toString();
  }
}

class _ListTagsForResourceResponseRestJson1Serializer
    extends _i3.StructuredSmithySerializer<ListTagsForResourceResponse> {
  const _ListTagsForResourceResponseRestJson1Serializer()
      : super('ListTagsForResourceResponse');

  @override
  Iterable<Type> get types =>
      const [ListTagsForResourceResponse, _$ListTagsForResourceResponse];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols =>
      const [_i3.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  ListTagsForResourceResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = ListTagsForResourceResponseBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ResourceArn':
          result.resourceArn = (serializers.deserialize(value!,
              specifiedType: const FullType(String)) as String);
          break;
        case 'Tags':
          result.tags.replace((serializers.deserialize(value,
                  specifiedType: const FullType(
                      _i2.BuiltMap, [FullType(String), FullType(String)]))
              as _i2.BuiltMap<String, String>));
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
      {FullType specifiedType = FullType.unspecified}) {
    final payload = (object as ListTagsForResourceResponse);
    final result = <Object?>[
      'ResourceArn',
      serializers.serialize(payload.resourceArn,
          specifiedType: const FullType(String)),
      'Tags',
      serializers.serialize(payload.tags,
          specifiedType: const FullType(
              _i2.BuiltMap, [FullType(String), FullType(String)]))
    ];
    return result;
  }
}
