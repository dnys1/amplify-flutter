// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.put_rum_events_request;

import 'package:aws_common/aws_common.dart' as _i2;
import 'package:aws_rum_dart/src/sdk/src/rum/model/app_monitor_details.dart'
    as _i3;
import 'package:aws_rum_dart/src/sdk/src/rum/model/rum_event.dart' as _i5;
import 'package:aws_rum_dart/src/sdk/src/rum/model/user_details.dart' as _i6;
import 'package:built_collection/built_collection.dart' as _i4;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart' as _i7;
import 'package:smithy/smithy.dart' as _i1;

part 'put_rum_events_request.g.dart';

abstract class PutRumEventsRequest
    with
        _i1.HttpInput<PutRumEventsRequestPayload>,
        _i2.AWSEquatable<PutRumEventsRequest>
    implements
        Built<PutRumEventsRequest, PutRumEventsRequestBuilder>,
        _i1.HasPayload<PutRumEventsRequestPayload> {
  factory PutRumEventsRequest(
      {required _i3.AppMonitorDetails appMonitorDetails,
      required String batchId,
      required String id,
      required _i4.BuiltList<_i5.RumEvent> rumEvents,
      required _i6.UserDetails userDetails}) {
    return _$PutRumEventsRequest._(
        appMonitorDetails: appMonitorDetails,
        batchId: batchId,
        id: id,
        rumEvents: rumEvents,
        userDetails: userDetails);
  }

  factory PutRumEventsRequest.build(
          [void Function(PutRumEventsRequestBuilder) updates]) =
      _$PutRumEventsRequest;

  const PutRumEventsRequest._();

  factory PutRumEventsRequest.fromRequest(
          PutRumEventsRequestPayload payload, _i2.AWSBaseHttpRequest request,
          {Map<String, String> labels = const {}}) =>
      PutRumEventsRequest.build((b) {
        b.appMonitorDetails.replace(payload.appMonitorDetails);
        b.batchId = payload.batchId;
        b.rumEvents.replace(payload.rumEvents);
        b.userDetails.replace(payload.userDetails);
        if (labels['id'] != null) {
          b.id = labels['id']!;
        }
      });

  static const List<_i1.SmithySerializer> serializers = [
    _PutRumEventsRequestRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(PutRumEventsRequestBuilder b) {}

  /// A structure that contains information about the app monitor that collected this telemetry information.
  _i3.AppMonitorDetails get appMonitorDetails;

  /// A unique identifier for this batch of RUM event data.
  String get batchId;

  /// The ID of the app monitor that is sending this data.
  String get id;

  /// An array of structures that contain the telemetry event data.
  _i4.BuiltList<_i5.RumEvent> get rumEvents;

  /// A structure that contains information about the user session that this batch of events was collected from.
  _i6.UserDetails get userDetails;
  @override
  String labelFor(String key) {
    switch (key) {
      case 'Id':
        return id;
    }
    throw _i1.MissingLabelException(this, key);
  }

  @override
  PutRumEventsRequestPayload getPayload() => PutRumEventsRequestPayload((b) {
        b.appMonitorDetails.replace(appMonitorDetails);
        b.batchId = batchId;
        b.rumEvents.replace(rumEvents);
        b.userDetails.replace(userDetails);
      });
  @override
  List<Object?> get props =>
      [appMonitorDetails, batchId, id, rumEvents, userDetails];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('PutRumEventsRequest');
    helper.add('appMonitorDetails', appMonitorDetails);
    helper.add('batchId', batchId);
    helper.add('id', id);
    helper.add('rumEvents', rumEvents);
    helper.add('userDetails', userDetails);
    return helper.toString();
  }
}

@_i7.internal
abstract class PutRumEventsRequestPayload
    with _i2.AWSEquatable<PutRumEventsRequestPayload>
    implements
        Built<PutRumEventsRequestPayload, PutRumEventsRequestPayloadBuilder> {
  factory PutRumEventsRequestPayload(
          [void Function(PutRumEventsRequestPayloadBuilder) updates]) =
      _$PutRumEventsRequestPayload;

  const PutRumEventsRequestPayload._();

  @BuiltValueHook(initializeBuilder: true)
  static void _init(PutRumEventsRequestPayloadBuilder b) {}

  /// A structure that contains information about the app monitor that collected this telemetry information.
  _i3.AppMonitorDetails get appMonitorDetails;

  /// A unique identifier for this batch of RUM event data.
  String get batchId;

  /// An array of structures that contain the telemetry event data.
  _i4.BuiltList<_i5.RumEvent> get rumEvents;

  /// A structure that contains information about the user session that this batch of events was collected from.
  _i6.UserDetails get userDetails;
  @override
  List<Object?> get props =>
      [appMonitorDetails, batchId, rumEvents, userDetails];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('PutRumEventsRequestPayload');
    helper.add('appMonitorDetails', appMonitorDetails);
    helper.add('batchId', batchId);
    helper.add('rumEvents', rumEvents);
    helper.add('userDetails', userDetails);
    return helper.toString();
  }
}

class _PutRumEventsRequestRestJson1Serializer
    extends _i1.StructuredSmithySerializer<PutRumEventsRequestPayload> {
  const _PutRumEventsRequestRestJson1Serializer()
      : super('PutRumEventsRequest');

  @override
  Iterable<Type> get types => const [
        PutRumEventsRequest,
        _$PutRumEventsRequest,
        PutRumEventsRequestPayload,
        _$PutRumEventsRequestPayload
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols =>
      const [_i1.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  PutRumEventsRequestPayload deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = PutRumEventsRequestPayloadBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'AppMonitorDetails':
          result.appMonitorDetails.replace((serializers.deserialize(value,
                  specifiedType: const FullType(_i3.AppMonitorDetails))
              as _i3.AppMonitorDetails));
          break;
        case 'BatchId':
          result.batchId = (serializers.deserialize(value!,
              specifiedType: const FullType(String)) as String);
          break;
        case 'RumEvents':
          result.rumEvents.replace((serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i4.BuiltList, [FullType(_i5.RumEvent)]))
              as _i4.BuiltList<_i5.RumEvent>));
          break;
        case 'UserDetails':
          result.userDetails.replace((serializers.deserialize(value,
                  specifiedType: const FullType(_i6.UserDetails))
              as _i6.UserDetails));
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
      {FullType specifiedType = FullType.unspecified}) {
    final payload = object is PutRumEventsRequest
        ? object.getPayload()
        : (object as PutRumEventsRequestPayload);
    final result = <Object?>[
      'AppMonitorDetails',
      serializers.serialize(payload.appMonitorDetails,
          specifiedType: const FullType(_i3.AppMonitorDetails)),
      'BatchId',
      serializers.serialize(payload.batchId,
          specifiedType: const FullType(String)),
      'RumEvents',
      serializers.serialize(payload.rumEvents,
          specifiedType:
              const FullType(_i4.BuiltList, [FullType(_i5.RumEvent)])),
      'UserDetails',
      serializers.serialize(payload.userDetails,
          specifiedType: const FullType(_i6.UserDetails))
    ];
    return result;
  }
}
