import 'package:aws_common/aws_common.dart';
import 'package:json_annotation/json_annotation.dart';

/// {@template endpoint.Endpoint}
///
/// {@endtemplate}
@JsonSerializable()
class Endpoint
    with
        AWSEquatable<Endpoint>,
        AWSSerializable<Map<String, Object?>>,
        AWSDebuggable {
  /// {@macro endpoint.Endpoint}
  const Endpoint();

  /// Deserializes a [Endpoint] from JSON.
  ///
  /// {@macro endpoint.Endpoint}
  factory Endpoint.fromJson(Map<String, Object?> json) =>
      _$EndpointFromJson(json);

  @override
  List<Object?> get props => [];

  @override
  String get runtimeTypeName => 'Endpoint';

  @override
  Map<String, Object?> toJson() => _$EndpointToJson(this);
}
