// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';

import 'package:aws_common/src/config/aws_config_value.dart';
import 'package:aws_common/src/config/aws_region.dart';
import 'package:aws_common/src/credentials/aws_credentials_provider.dart';
import 'package:aws_common/src/http/aws_http_client.dart';
import 'package:meta/meta.dart';

/// {@template aws_common.config.aws_config}
/// A fully loaded, reconciled AWS configuration which can be used when instantiating
/// service clients.
/// {@endtemplate}
abstract class AWSConfig implements AWSConfigLoader {
  /// {@macro aws_common.config.aws_config}
  factory AWSConfig({
    AWSRegion? region,
    Uri? endpoint,
    AWSCredentialsProvider credentialsProvider =
        const AWSCredentialsProvider.defaultChain(),
    bool useFips = false,
    bool useDualStack = false,
    AWSHttpClient? httpClient,
  }) =>
      _SharedAWSConfig(
        region: region,
        endpoint: endpoint,
        credentialsProvider: credentialsProvider,
        httpClient: httpClient ?? AWSHttpClient(),
        useDualStack: useDualStack,
        useFips: useFips,
      );

  /// {@macro aws_common.config.aws_config}
  @protected
  const AWSConfig.protected();

  /// {@template aws_common.config.shared_config_loader}
  /// Loader for the shared AWS configuration.
  ///
  /// This value can be directly called or modified before loading to override
  /// the default values/providers.
  ///
  /// For example, to load with no modifications:
  /// ```dart
  /// final awsConfig = await AWSConfig.shared();
  /// ```
  ///
  /// To modify, use the `withX` methods before calling [AWSConfigLoader.load]
  ///
  /// ```dart
  /// final awsConfig = await AWSConfig.shared
  ///     .withRegion(AWSRegion.usEast1)
  ///     .withProfileName('custom')
  ///     .withEndpointUri(Uri.parse('http://example.com'))
  ///     .load();
  /// ```
  /// {@endtemplate}
  static SharedAWSConfigLoader get shared => SharedAWSConfigLoader();

  /// The AWS region to use for all SDK operations.
  AWSRegion? get region;

  /// The static endpoint URI to use for all SDK operations.
  Uri? get endpoint;

  /// The [AWSCredentialsProvider] to use for all signing operations.
  ///
  /// Defaults to [AWSCredentialsProvider.defaultChain].
  AWSCredentialsProvider get credentialsProvider;

  /// Whether to use FIPS endpoints, when available.
  ///
  /// Defaults to `false`.
  bool get useFips;

  /// Whether to use dual-stack endpoints, when available.
  ///
  /// Defaults to `false`.
  bool get useDualStack;

  /// The HTTP client to use for all SDK operations.
  ///
  /// Defaults to [AWSHttpClient.new].
  AWSHttpClient? get httpClient;

  @override
  AWSConfig load() => this;
}

/// A builder object for configuring overrides on a shared AWS configuration.
///
/// Once any customizations are set, call [load] to get an immutable [AWSConfig]
/// which can be used when constructing service clients.
abstract interface class AWSConfigLoader {
  /// {@template aws_common.config.aws_config_loader.load}
  /// Loads the immutable [AWSConfig] with the configuration overrides
  /// specified by this loader.
  /// {@endtemplate}
  @useResult
  FutureOr<AWSConfig> load();
}

final class _SharedAWSConfig extends AWSConfig {
  const _SharedAWSConfig({
    required this.region,
    required this.endpoint,
    required this.credentialsProvider,
    required this.httpClient,
    required this.useDualStack,
    required this.useFips,
  }) : super.protected();

  @override
  final AWSRegion? region;

  @override
  final Uri? endpoint;

  @override
  final AWSCredentialsProvider credentialsProvider;

  @override
  final AWSHttpClient? httpClient;

  @override
  final bool useFips;

  @override
  final bool useDualStack;
}

/// {@macro aws_common.config.shared_config_loader}
final class SharedAWSConfigLoader implements AWSConfigLoader {
  /// Configures an AWS region to use for all SDK operations.
  ///
  /// This can be either a static [AWSRegion] or an [AWSConfigValueResolver]
  /// which loads a region value using custom logic.
  @useResult
  SharedAWSConfigLoader withRegion(AWSConfigValueResolver<AWSRegion> region) {
    _region = region;
    return this;
  }

  AWSConfigValueResolver<AWSRegion>? _region;

  /// Configures a static endpoint URI for all SDK operations.
  @useResult
  SharedAWSConfigLoader withEndpoint(Uri endpoint) {
    _endpoint = endpoint;
    return this;
  }

  Uri? _endpoint;

  /// Configures the [AWSCredentialsProvider] to use for all signing operations.
  ///
  /// Defaults to [AWSCredentialsProvider.defaultChain].
  @useResult
  SharedAWSConfigLoader withCredentialsProvider(
    AWSCredentialsProvider credentialsProvider,
  ) {
    _credentialsProvider = credentialsProvider;
    return this;
  }

  AWSCredentialsProvider? _credentialsProvider;

  /// Configures the default [profileName].
  ///
  /// If provided, the default [AWSConfigValueResolver]s will search
  /// this profile when conducting their search.
  @useResult
  SharedAWSConfigLoader withProfileName(String profileName) {
    _profileName = profileName;
    return this;
  }

  String? _profileName;

  /// Configures the default HTTP client to use for performing SDK operations.
  @useResult
  SharedAWSConfigLoader withHttpClient(AWSHttpClient httpClient) {
    _httpClient = httpClient;
    return this;
  }

  AWSHttpClient? _httpClient;

  /// Configures the SDK to use FIPS endpoints when available.
  @useResult
  SharedAWSConfigLoader useFips() {
    _useFips = true;
    return this;
  }

  /// Configures the SDK to never use FIPS endpoints, even when available.
  @useResult
  SharedAWSConfigLoader noUseFips() {
    _useFips = false;
    return this;
  }

  bool? _useFips;

  /// Configures the SDK to use dual-stack endpoints when available.
  @useResult
  SharedAWSConfigLoader useDualStack() {
    _useDualStack = true;
    return this;
  }

  /// Configures the SDK to never use dual-stack endpoints, even when available.
  @useResult
  SharedAWSConfigLoader noUseDualStack() {
    _useDualStack = false;
    return this;
  }

  bool? _useDualStack;

  /// The default resolver for the `region` configuration.
  AWSConfigValueResolver<AWSRegion?> get _defaultRegionResolver =>
      AWSConfigValueResolverChain(
        name: 'region',
        chain: [
          const AWSConfigValueEnvironmentResolver(
            name: 'region',
            value: AWSConfigValue.region,
          ),
          const AWSConfigValueEnvironmentResolver(
            name: 'region',
            value: AWSConfigValue.defaultRegion,
          ),
          AWSConfigValueProfileResolver(
            name: 'region',
            profileName: _profileName,
            fromProfile: (profile) => profile.region,
          ),
        ],
      );

  /// The default resolver for the `useDualstackEndpoint` configuration.
  AWSConfigValueResolver<bool> get _defaultUseDualstackResolver =>
      AWSConfigValueResolverChain(
        name: 'use-dualstack-endpoint',
        defaultValue: false,
        chain: [
          const AWSConfigValueEnvironmentResolver(
            name: 'use-dualstack-endpoint',
            value: AWSConfigValue.useDualstackEndpoint,
          ),
          AWSConfigValueProfileResolver(
            name: 'use-dualstack-endpoint',
            profileName: _profileName,
            fromProfile: (profile) => profile.useDualstackEndpoint,
          ),
        ],
      );

  /// The default resolver for the `useFipsEndpoint` configuration.
  AWSConfigValueResolver<bool> get _defaultUseFipsResolver =>
      AWSConfigValueResolverChain(
        name: 'use-fips-endpoint',
        defaultValue: false,
        chain: [
          const AWSConfigValueEnvironmentResolver(
            name: 'use-fips-endpoint',
            value: AWSConfigValue.useFipsEndpoint,
          ),
          AWSConfigValueProfileResolver(
            name: 'use-fips-endpoint',
            profileName: _profileName,
            fromProfile: (profile) => profile.useFipsEndpoint,
          ),
        ],
      );

  // AWSConfigValueResolver

  /// {@macro aws_common.config.aws_config_loader.load}
  @useResult
  Future<AWSConfig> call() => load();

  @override
  Future<AWSConfig> load() async {
    final region = await (_region ?? _defaultRegionResolver).resolve();
    final useDualstack =
        _useDualStack ?? (await _defaultUseDualstackResolver.resolve());
    final useFips = _useFips ?? (await _defaultUseFipsResolver.resolve());
    return _SharedAWSConfig(
      region: region,
      endpoint: _endpoint,
      credentialsProvider: _credentialsProvider ??
          AWSCredentialsProvider.defaultChain(profileName: _profileName),
      httpClient: _httpClient,
      useDualStack: useDualstack,
      useFips: useFips,
    );
  }
}
