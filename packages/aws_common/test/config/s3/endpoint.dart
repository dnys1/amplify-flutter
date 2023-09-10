import 'package:aws_common/src/config/aws_region.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'endpoint.g.dart';

abstract class Endpoint implements Built<Endpoint, EndpointBuilder> {
  factory Endpoint({
    required Uri uri,
    Map<String, List<String>> headers = const {},
    Map<String, Object?> properties = const {},
  }) {
    return _$Endpoint._(
      uri: uri,
      headers: BuiltListMultimap(headers),
      properties: BuiltMap.of(properties),
    );
  }

  factory Endpoint.build(void Function(EndpointBuilder) updates) = _$Endpoint;
  const Endpoint._();

  Uri get uri;
  BuiltListMultimap<String, String> get headers;
  BuiltMap<String, Object?> get properties;
}

// https://github.com/awslabs/aws-sdk-rust/blob/7113b77c0ee01b1bc69cf97d5dcf03e9b259ed89/sdk/s3/src/config/endpoint.rs#L7740
final class S3EndpointParameters {
  const S3EndpointParameters({
    this.bucket,
    this.region,
    this.useFips = false,
    this.useDualStack = false,
    this.endpoint,
    this.forcePathStyle = false,
    this.accelerate = false,
    this.useGlobalEndpoint = false,
    this.useObjectLambdaEndpoint,
    this.disableAccessPoints,
    this.disableMultiRegionAccessPoints = false,
    this.useArnRegion,
  });

  final String? bucket;
  final AWSRegion? region;
  final bool useFips;
  final bool useDualStack;
  final String? endpoint;
  final bool forcePathStyle;
  final bool accelerate;
  final bool useGlobalEndpoint;
  final bool? useObjectLambdaEndpoint;
  final bool? disableAccessPoints;
  final bool disableMultiRegionAccessPoints;
  final bool? useArnRegion;
}
