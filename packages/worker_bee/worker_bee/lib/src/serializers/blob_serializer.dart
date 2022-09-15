import 'dart:typed_data';

import 'package:built_value/serializer.dart';

/// {@template worker_bee.serializer.blob_serializer}
/// A `built_value` serializer for [Uint8List] types.
/// {@endtemplate}
class BlobSerializer implements PrimitiveSerializer<Uint8List> {
  /// {@macro worker_bee.serializer.blob_serializer}
  const BlobSerializer();

  @override
  Uint8List deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return (serialized as ByteBuffer).asUint8List();
  }

  @override
  Object serialize(
    Serializers serializers,
    Uint8List object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return object.buffer;
  }

  @override
  Iterable<Type> get types => [Uint8List, Uint8List(0).runtimeType];

  @override
  String get wireName => 'Uint8List';
}
