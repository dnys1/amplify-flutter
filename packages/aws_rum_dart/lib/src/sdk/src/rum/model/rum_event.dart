// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.rum_event;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart' as _i2;
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'rum_event.g.dart';

/// A structure that contains the information for one performance event that RUM collects from a user session with your application.
abstract class RumEvent
    with _i1.AWSEquatable<RumEvent>
    implements Built<RumEvent, RumEventBuilder> {
  /// A structure that contains the information for one performance event that RUM collects from a user session with your application.
  factory RumEvent(
      {required _i2.JsonObject details,
      required String id,
      _i2.JsonObject? metadata,
      required DateTime timestamp,
      required String type}) {
    return _$RumEvent._(
        details: details,
        id: id,
        metadata: metadata,
        timestamp: timestamp,
        type: type);
  }

  /// A structure that contains the information for one performance event that RUM collects from a user session with your application.
  factory RumEvent.build([void Function(RumEventBuilder) updates]) = _$RumEvent;

  const RumEvent._();

  static const List<_i3.SmithySerializer> serializers = [
    _RumEventRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(RumEventBuilder b) {}

  /// A string containing details about the event.
  _i2.JsonObject get details;

  /// A unique ID for this event.
  String get id;

  /// Metadata about this event, which contains a JSON serialization of the identity of the user for this session. The user information comes from information such as the HTTP user-agent request header and document interface.
  _i2.JsonObject? get metadata;

  /// The exact time that this event occurred.
  DateTime get timestamp;

  /// The JSON schema that denotes the type of event this is, such as a page load or a new session.
  String get type;
  @override
  List<Object?> get props => [details, id, metadata, timestamp, type];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('RumEvent');
    helper.add('details', details);
    helper.add('id', id);
    helper.add('metadata', metadata);
    helper.add('timestamp', timestamp);
    helper.add('type', type);
    return helper.toString();
  }
}

class _RumEventRestJson1Serializer
    extends _i3.StructuredSmithySerializer<RumEvent> {
  const _RumEventRestJson1Serializer() : super('RumEvent');

  @override
  Iterable<Type> get types => const [RumEvent, _$RumEvent];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols =>
      const [_i3.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  RumEvent deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = RumEventBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'details':
          result.details = const _i3.EncodedJsonObjectSerializer()
              .deserialize(serializers, value!);
          break;
        case 'id':
          result.id = (serializers.deserialize(value!,
              specifiedType: const FullType(String)) as String);
          break;
        case 'metadata':
          if (value != null) {
            result.metadata = const _i3.EncodedJsonObjectSerializer()
                .deserialize(serializers, value);
          }
          break;
        case 'timestamp':
          result.timestamp = (serializers.deserialize(value!,
              specifiedType: const FullType(DateTime)) as DateTime);
          break;
        case 'type':
          result.type = (serializers.deserialize(value!,
              specifiedType: const FullType(String)) as String);
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(Serializers serializers, Object? object,
      {FullType specifiedType = FullType.unspecified}) {
    final payload = (object as RumEvent);
    final result = <Object?>[
      'details',
      const _i3.EncodedJsonObjectSerializer()
          .serialize(serializers, payload.details),
      'id',
      serializers.serialize(payload.id, specifiedType: const FullType(String)),
      'timestamp',
      serializers.serialize(payload.timestamp,
          specifiedType: const FullType(DateTime)),
      'type',
      serializers.serialize(payload.type, specifiedType: const FullType(String))
    ];
    if (payload.metadata != null) {
      result
        ..add('metadata')
        ..add(const _i3.EncodedJsonObjectSerializer()
            .serialize(serializers, payload.metadata!));
    }
    return result;
  }
}
