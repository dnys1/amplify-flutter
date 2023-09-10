import 'dart:async';

import 'package:async/async.dart';
import 'package:aws_common/aws_common.dart';
import 'package:meta/meta.dart';

import 'endpoint.dart';

sealed class _S3ClientConfigLoader implements AWSConfigLoader {
  @override
  FutureOr<S3ClientConfig> load();
}

final class S3ClientConfigBuilder implements _S3ClientConfigLoader {
  S3ClientConfigBuilder([AWSConfigLoader? awsConfig])
      : _awsConfigLoader = awsConfig ?? AWSConfig.shared;

  final AWSConfigLoader _awsConfigLoader;

  // service-specific customizations are exposed via builder methods, e.g.
  var _accelerate = false;
  @useResult
  S3ClientConfigBuilder accelerate() {
    _accelerate = true;
    return this;
  }

  var _forcePathStyle = false;
  @useResult
  S3ClientConfigBuilder forcePathStyle() {
    _forcePathStyle = true;
    return this;
  }

  @useResult
  Future<S3ClientConfig> build() => load();

  @override
  Future<S3ClientConfig> load() async {
    // loads AWS config + constructs ServiceClientConfig
    final awsConfig = await _awsConfigLoader.load();
    return S3ClientConfig(
      region: awsConfig.region ??
          (throw StateError('Region could not be determined')),
      endpoint: awsConfig.endpoint,
      credentialsProvider: awsConfig.credentialsProvider,
      httpClient: awsConfig.httpClient,
      useDualStack: awsConfig.useDualStack,
      useFips: awsConfig.useFips,
      accelerate: _accelerate,
      forcePathStyle: _forcePathStyle,
    );
  }
}

final class S3ClientConfig implements AWSConfig, _S3ClientConfigLoader {
  const S3ClientConfig({
    // Base AWSConfig properties
    required this.region,
    this.endpoint,
    this.credentialsProvider = const AWSCredentialsProvider.defaultChain(),
    this.httpClient,
    this.useDualStack = false,
    this.useFips = false,

    // S3 customizations
    this.accelerate = false,
    this.forcePathStyle = false,
  });

  @override
  final AWSRegion region;

  @override
  final Uri? endpoint;

  @override
  final AWSCredentialsProvider credentialsProvider;

  @override
  final AWSHttpClient? httpClient;

  @override
  final bool useDualStack;

  @override
  final bool useFips;

  final bool accelerate;
  final bool forcePathStyle;

  @override
  S3ClientConfig load() => this;
}

class S3Client {
  S3Client([AWSConfigLoader? config])
      : _configLoader = switch (config) {
          final S3ClientConfig config => config,
          final S3ClientConfigBuilder builder => builder,
          _ => S3ClientConfigBuilder(config),
        };

  final _S3ClientConfigLoader _configLoader;
  final AsyncMemoizer<S3ClientConfig> _configMemo = AsyncMemoizer();
  // ignore: unused_element
  Future<S3ClientConfig> get _config => _configMemo.runOnce(_configLoader.load);
}

abstract interface class EndpointResolver<EndpointParameters> {
  Future<Endpoint> resolveEndpoint(EndpointParameters parameters);
}

abstract interface class S3EndpointResolver
    implements EndpointResolver<S3EndpointParameters> {
  const factory S3EndpointResolver() = _DefaultS3EndpointResolver;
}

final class _DefaultS3EndpointResolver implements S3EndpointResolver {
  const _DefaultS3EndpointResolver();

  @override
  Future<Endpoint> resolveEndpoint(S3EndpointParameters parameters) {
    throw UnimplementedError();
  }
}

Future<void> main() async {
  final awsConfig = AWSConfig.shared
      .withRegion(AWSRegion.usWest2)
      .withProfileName('my-profile');
  final s3Config =
      S3ClientConfigBuilder(awsConfig).accelerate().forcePathStyle();
  // ignore: unused_local_variable
  final s3Client = S3Client(s3Config);
}
