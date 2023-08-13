// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';

import 'package:aws_common/aws_common.dart';
import 'package:aws_common/src/config/aws_config_stub.dart'
    if (dart.library.io) 'package:aws_common/src/config/aws_config_io.dart';
import 'package:aws_common/src/config/config_file/file_loader.dart';

export 'package:aws_common/src/config/aws_config_stub.dart'
    if (dart.library.io) 'package:aws_common/src/config/aws_config_io.dart';

T _identity<T extends Object>(String o) => o as T;

/// A configuration value for use with AWS packages.
enum AWSConfigValue<T extends Object?> {
  /// The `AWS_MAX_ATTEMPTS` value specifies how many HTTP requests an SDK
  /// should make for a single SDK operation invocation before giving up.
  ///
  /// Defaults to `3`.
  maxAttempts<int>._(
    'AWS_MAX_ATTEMPTS',
    String.fromEnvironment('AWS_MAX_ATTEMPTS'),
    defaultValue: 3,
    parse: int.parse,
  ),

  /// The region to use for AWS operations.
  region<AWSRegion>._(
    'AWS_REGION',
    String.fromEnvironment('AWS_REGION'),
    parse: AWSRegion.new,
  ),

  /// The default region to use when [region] is unset.
  defaultRegion<AWSRegion>._(
    'AWS_DEFAULT_REGION',
    String.fromEnvironment('AWS_DEFAULT_REGION'),
    parse: AWSRegion.new,
  ),

  /// The location (filepath) of the AWS configuration file.
  ///
  /// Defaults to `~/.aws/config`.
  configFile<String>._(
    'AWS_CONFIG_FILE',
    String.fromEnvironment('AWS_CONFIG_FILE'),
    defaultValue: '~/.aws/config',
  ),

  /// The location (filepath) of the AWS shared credentials file.
  ///
  /// Defaults to `~/.aws/credentials`.
  sharedCredentialsFile<String>._(
    'AWS_SHARED_CREDENTIALS_FILE',
    String.fromEnvironment('AWS_SHARED_CREDENTIALS_FILE'),
    defaultValue: '~/.aws/credentials',
  ),

  /// Whether to use FIPS-compliant endpoints, when available.
  ///
  /// Defaults to `false`.
  ///
  /// See: https://docs.aws.amazon.com/sdkref/latest/guide/feature-endpoints.html
  useFipsEndpoint<bool>._(
    'AWS_USE_FIPS_ENDPOINT',
    String.fromEnvironment('AWS_USE_FIPS_ENDPOINT'),
    parse: bool.parse,
  ),

  /// Whether to use dual-stack endpoints, when available.
  ///
  /// Defaults to `false`.
  ///
  /// See: https://docs.aws.amazon.com/sdkref/latest/guide/feature-endpoints.html
  useDualstackEndpoint<bool>._(
    'AWS_USE_DUALSTACK_ENDPOINT',
    String.fromEnvironment('AWS_USE_DUALSTACK_ENDPOINT'),
    parse: bool.parse,
  );

  const AWSConfigValue._(
    this.key,
    this._fromEnv, {
    this.defaultValue,
    T Function(String)? parse,
  }) : _parse = parse ?? _identity;

  /// The environment variable key.
  final String key;

  /// The default value of the configuration parameter.
  final T? defaultValue;

  final String? _fromEnv;
  final T Function(String) _parse;
  String? get _fromPlatformEnv => lookupPlatformEnv(key);

  /// The value of the configuration parameter. Lookup order:
  /// 1. [Zone] overrides
  /// 2. Dart environment
  /// 3. Platform environment
  /// 4. Default value
  ///
  /// Throws an [Exception] if no value is found in the search. Use [valueOrNull]
  /// to get a nullable result in this case.
  T get value {
    final fromOverride = Zone.current[this] as Object?;
    if (fromOverride is T) {
      return fromOverride;
    } else if (fromOverride is String) {
      return _parse(fromOverride);
    }
    final fromEnv = _fromEnv;
    if (fromEnv != null && fromEnv.isNotEmpty) {
      return _parse(fromEnv);
    }
    final fromPlatformEnv = _fromPlatformEnv;
    if (fromPlatformEnv != null && fromPlatformEnv.isNotEmpty) {
      return _parse(fromPlatformEnv);
    }
    if (defaultValue != null) {
      return defaultValue!;
    }
    throw AWSConfigValueException(key, reason: 'Not present in environment');
  }

  /// Returns the [value] present in the environment, or `null` if not found.
  T? get valueOrNull => AWSResult.captureSync(() => value).valueOrNull;
}

/// {@template aws_common.config.aws_config_value_resolver}
/// Resolves an AWS configuration value of type [T].
/// {@endtemplate}
abstract interface class AWSConfigValueResolver<T extends Object?>
    implements AWSDebuggable {
  /// {@macro aws_common.config.aws_config_value_resolver}
  FutureOr<T> resolve();
}

typedef _Nullable<T extends Object?> = T?;

bool _isNullable<T extends Object?>() => T == _Nullable<T>;

/// {@template aws_common.config.aws_config_value_environment_resolver}
/// Resolves an AWS configuration value of type [T] from the environment.
/// {@endtemplate}
final class AWSConfigValueEnvironmentResolver<T extends Object?>
    implements AWSConfigValueResolver<T> {
  /// {@macro aws_common.config.aws_config_value_environment_resolver}
  const AWSConfigValueEnvironmentResolver({
    required this.name,
    required this.value,
  });

  /// The name of the configuration value, used for debugging purposes.
  final String name;

  /// The [AWSConfigValue] for the property.
  final AWSConfigValue<T> value;

  @override
  T resolve() {
    if (_isNullable<T>()) {
      return value.valueOrNull as T;
    }
    return value.value;
  }

  @override
  String get runtimeTypeName => 'AWSConfigValueEnvironmentResolver';
}

/// {@template aws_common.config.aws_config_value_profile_resolver}
/// Resolves an AWS configuration value of type [T] from the profile
/// named [profileName].
/// {@endtemplate}
final class AWSConfigValueProfileResolver<T extends Object?>
    implements AWSConfigValueResolver<T> {
  /// {@macro aws_common.config.aws_config_value_profile_resolver}
  const AWSConfigValueProfileResolver({
    required this.name,
    required String? profileName,
    required this.fromProfile,
  }) : profileName = profileName ?? AWSProfileFile.defaultProfileName;

  /// The name of the configuration value, used for debugging purposes.
  final String name;

  /// The name of the profile to load.
  final String profileName;

  /// An extractor which retrieves the value from the loaded profile.
  final T? Function(AWSProfile profile) fromProfile;

  @override
  Future<T> resolve() async {
    final profileFile = await const AWSProfileFileLoader().load();
    final profile = profileFile.profiles[profileName];
    if (profile == null) {
      throw AWSConfigValueException(
        name,
        reason: 'No profile with name $profileName was found',
      );
    }
    final value = fromProfile(profile);
    if (value != null) {
      return value;
    }
    if (_isNullable<T>()) {
      return null as T;
    }
    throw AWSConfigValueException(
      name,
      reason: '$name property not found in profile $profileName',
    );
  }

  @override
  String get runtimeTypeName => 'AWSConfigValueProfileResolver';
}

/// {@template aws_common.config.aws_config_value_resolver_chain}
/// Resolvers an AWS configuration value of type [T] using a
/// pre-configured list of [AWSConfigValueResolver]s to iterate through.
/// {@endtemplate}
final class AWSConfigValueResolverChain<T extends Object?>
    with AWSDebuggable, AWSLoggerMixin
    implements AWSConfigValueResolver<T> {
  /// {@macro aws_common.config.aws_config_value_resolver_chain}
  const AWSConfigValueResolverChain({
    required this.name,
    required this.chain,
    this.defaultValue,
  });

  /// The name of the configuration value, used for debugging purposes.
  final String name;

  /// The chain of resolvers to search in order.
  final List<AWSConfigValueResolver<T>> chain;

  /// The default value if not found in the [chain].
  final T? defaultValue;

  @override
  String get runtimeTypeName => 'AWSConfigValueResolverChain<$T>($name)';

  @override
  Future<T> resolve() async {
    final chain = List.of(this.chain);
    for (final provider in chain) {
      final providerType = provider.runtimeTypeName;
      switch (await AWSResult.capture(provider.resolve)) {
        case AWSSuccessResult(value: final value):
          logger.verbose(
            'Successfully loaded $name from $providerType',
          );
          return value;
        case AWSErrorResult(:final exception):
          logger.verbose('Failed to load $name from $providerType', exception);
      }
    }
    if (defaultValue != null) {
      return defaultValue!;
    }
    if (_isNullable<T>()) {
      return null as T;
    }
    throw AWSConfigValueException(
      name,
      chain: chain.map((resolver) => resolver.runtimeTypeName).toList(),
    );
  }
}

/// {@template aws_common.config.aws_config_value_resolver_exception}
/// Thrown when an AWS configuration value is required but could not
/// be resolved.
///
/// Providing the [chain] of resolvers searched will include the search
/// path in the message.
/// {@endtemplate}
final class AWSConfigValueException implements Exception {
  /// {@macro aws_common.config.aws_config_value_resolver_exception}
  const AWSConfigValueException(this.name, {this.reason, this.chain});

  /// The human-friendly name of the configuration value which could not be resolved.
  final String name;

  /// An optional reason why the lookup failed.
  final String? reason;

  /// The list of resolver types which were searched during resolution.
  final List<String>? chain;

  @override
  String toString() {
    final message = StringBuffer(
      'AWSConfigValueException: Could not load value for $name',
    );
    if (reason != null) {
      message.write(': $reason.');
    }
    if (chain != null) {
      message.write('\n\nSearched: [${chain!.join(', ')}]');
    }
    return message.toString();
  }
}
