// Generated with smithy-dart 0.5.5. DO NOT MODIFY.

library aws_rum_dart.rum.model.app_monitor_details;

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'app_monitor_details.g.dart';

/// A structure that contains information about the RUM app monitor.
abstract class AppMonitorDetails
    with _i1.AWSEquatable<AppMonitorDetails>
    implements Built<AppMonitorDetails, AppMonitorDetailsBuilder> {
  /// A structure that contains information about the RUM app monitor.
  factory AppMonitorDetails({String? id, String? name, String? version}) {
    return _$AppMonitorDetails._(id: id, name: name, version: version);
  }

  /// A structure that contains information about the RUM app monitor.
  factory AppMonitorDetails.build(
      [void Function(AppMonitorDetailsBuilder) updates]) = _$AppMonitorDetails;

  const AppMonitorDetails._();

  static const List<_i2.SmithySerializer> serializers = [
    _AppMonitorDetailsRestJson1Serializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(AppMonitorDetailsBuilder b) {}

  /// The unique ID of the app monitor.
  String? get id;

  /// The name of the app monitor.
  String? get name;

  /// The version of the app monitor.
  String? get version;
  @override
  List<Object?> get props => [id, name, version];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AppMonitorDetails');
    helper.add('id', id);
    helper.add('name', name);
    helper.add('version', version);
    return helper.toString();
  }
}

class _AppMonitorDetailsRestJson1Serializer
    extends _i2.StructuredSmithySerializer<AppMonitorDetails> {
  const _AppMonitorDetailsRestJson1Serializer() : super('AppMonitorDetails');

  @override
  Iterable<Type> get types => const [AppMonitorDetails, _$AppMonitorDetails];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols =>
      const [_i2.ShapeId(namespace: 'aws.protocols', shape: 'restJson1')];
  @override
  AppMonitorDetails deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = AppMonitorDetailsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          if (value != null) {
            result.id = (serializers.deserialize(value,
                specifiedType: const FullType(String)) as String);
          }
          break;
        case 'name':
          if (value != null) {
            result.name = (serializers.deserialize(value,
                specifiedType: const FullType(String)) as String);
          }
          break;
        case 'version':
          if (value != null) {
            result.version = (serializers.deserialize(value,
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
    final payload = (object as AppMonitorDetails);
    final result = <Object?>[];
    if (payload.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(payload.id!,
            specifiedType: const FullType(String)));
    }
    if (payload.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(payload.name!,
            specifiedType: const FullType(String)));
    }
    if (payload.version != null) {
      result
        ..add('version')
        ..add(serializers.serialize(payload.version!,
            specifiedType: const FullType(String)));
    }
    return result;
  }
}
