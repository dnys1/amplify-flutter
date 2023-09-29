// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.put_rum_events_response;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'put_rum_events_response.g.dart';

abstract class PutRumEventsResponse
    with _i1.AWSEquatable<PutRumEventsResponse>
    implements
        Built<PutRumEventsResponse, PutRumEventsResponseBuilder>,
        _i2.EmptyPayload {
  factory PutRumEventsResponse() {
    return _$PutRumEventsResponse._();
  }

  factory PutRumEventsResponse.build(
          [void Function(PutRumEventsResponseBuilder) updates]) =
      _$PutRumEventsResponse;

  const PutRumEventsResponse._();

  /// Constructs a [PutRumEventsResponse] from a [payload] and [response].
  factory PutRumEventsResponse.fromResponse(
          PutRumEventsResponse payload, _i1.AWSBaseHttpResponse response) =>
      payload;

  static const List<_i2.SmithySerializer> serializers = [
    _PutRumEventsResponseRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(PutRumEventsResponseBuilder b) {}
  @override
  List<Object?> get props => [];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('PutRumEventsResponse');
    return helper.toString();
  }
}

class _PutRumEventsResponseRestJson1Serializer
    extends _i2.StructuredSmithySerializer<PutRumEventsResponse> {
  const _PutRumEventsResponseRestJson1Serializer()
      : super('PutRumEventsResponse');

  @override
  Iterable<Type> get types =>
      const [PutRumEventsResponse, _$PutRumEventsResponse];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  PutRumEventsResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return PutRumEventsResponseBuilder().build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
          {FullType specifiedType = FullType.unspecified}) =>
      const <Object?>[];
}
