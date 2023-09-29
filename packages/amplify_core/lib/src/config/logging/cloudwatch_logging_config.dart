// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_core/amplify_core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'cloudwatch_logging_config.g.dart';

/// {@template amplify_core.cloudwatch_plugin_config_factory}
/// Configuration factory for [CloudWatchPluginConfig].
/// {@endtemplate}
@internal
class CloudWatchPluginConfigFactory
    extends AmplifyPluginConfigFactory<CloudWatchPluginConfig> {
  /// {@macro amplify_core.cloudwatch_plugin_config_factory}
  const CloudWatchPluginConfigFactory();

  @override
  CloudWatchPluginConfig build(Map<String, Object?> json) {
    return CloudWatchPluginConfig.fromJson(json);
  }

  @override
  String get name => CloudWatchPluginConfig.pluginKey;
}

/// {@template amplify_core.cloudwatch_plugin_config}
/// The AWS CloudWatch plugin configuration.
/// {@endtemplate}
@zAmplifySerializable
class CloudWatchPluginConfig
    with AWSEquatable<CloudWatchPluginConfig>, AWSSerializable
    implements AmplifyPluginConfig {
  /// {@macro amplify_core.cloudwatch_plugin_config}
  const CloudWatchPluginConfig({
    this.enable = true,
    required this.logGroupName,
    required this.region,
    this.localStoreMaxSizeInMB = 5,
    this.flushIntervalInSeconds = 60,
    this.defaultRemoteConfiguration,
    this.loggingConstraints,
  });

  factory CloudWatchPluginConfig.fromJson(Map<String, Object?> json) =>
      _$CloudWatchPluginConfigFromJson(json);

  /// The plugin's configuration key.
  static const pluginKey = 'cloudWatchLoggerPluginConfiguration';

  final bool enable;
  final String logGroupName;
  final String region;
  final int localStoreMaxSizeInMB;
  final int flushIntervalInSeconds;
  final DefaultRemoteConfiguration? defaultRemoteConfiguration;
  final LoggingConstraints? loggingConstraints;

  @override
  String get name => pluginKey;

  @override
  List<Object?> get props => [];

  CloudWatchPluginConfig copyWith({
    bool? enable,
    String? logGroupName,
    String? region,
    int? localStoreMaxSizeInMB,
    int? flushIntervalInSeconds,
    DefaultRemoteConfiguration? defaultRemoteConfiguration,
    LoggingConstraints? loggingConstraints,
  }) {
    return CloudWatchPluginConfig(
      enable: enable ?? this.enable,
      logGroupName: logGroupName ?? this.logGroupName,
      region: region ?? this.region,
      localStoreMaxSizeInMB:
          localStoreMaxSizeInMB ?? this.localStoreMaxSizeInMB,
      flushIntervalInSeconds:
          flushIntervalInSeconds ?? this.flushIntervalInSeconds,
      defaultRemoteConfiguration:
          defaultRemoteConfiguration ?? this.defaultRemoteConfiguration,
      loggingConstraints: loggingConstraints ?? this.loggingConstraints,
    );
  }

  @override
  Map<String, Object?> toJson() => _$CloudWatchPluginConfigToJson(this);
}

@zAwsSerializable
class DefaultRemoteConfiguration
    with
        AWSEquatable<DefaultRemoteConfiguration>,
        AWSSerializable<Map<String, Object?>> {
  const DefaultRemoteConfiguration({
    required this.endpoint,
    this.refreshIntervalInSeconds = 1200,
  });

  factory DefaultRemoteConfiguration.fromJson(Map<String, Object?> json) =>
      _$DefaultRemoteConfigurationFromJson(json);

  final String endpoint;
  final int refreshIntervalInSeconds;

  @override
  List<Object?> get props => [endpoint, refreshIntervalInSeconds];

  @override
  Map<String, Object?> toJson() => _$DefaultRemoteConfigurationToJson(this);
}

@zAwsSerializable
@_LogLevelSerializer()
@_CategorySerializer()
class LoggingConstraints
    with
        AWSEquatable<LoggingConstraints>,
        AWSSerializable<Map<String, Object?>> {
  const LoggingConstraints({
    this.defaultLogLevel = LogLevel.error,
    this.categoryLogLevel = const {},
    this.userLogLevel = const {},
  });

  factory LoggingConstraints.fromJson(Map<String, Object?> json) =>
      _$LoggingConstraintsFromJson(json);

  final LogLevel defaultLogLevel;
  final Map<Category, LogLevel> categoryLogLevel;
  final Map<String, UserLogLevel> userLogLevel;

  @override
  List<Object?> get props => [
        defaultLogLevel,
        categoryLogLevel,
        userLogLevel,
      ];

  @override
  Map<String, Object?> toJson() => _$LoggingConstraintsToJson(this);
}

@zAwsSerializable
@_LogLevelSerializer()
@_CategorySerializer()
class UserLogLevel
    with AWSEquatable<UserLogLevel>, AWSSerializable<Map<String, Object?>> {
  const UserLogLevel({
    this.defaultLogLevel = LogLevel.error,
    this.categoryLogLevel = const {},
  });

  factory UserLogLevel.fromJson(Map<String, Object?> json) =>
      _$UserLogLevelFromJson(json);

  final LogLevel defaultLogLevel;
  final Map<Category, LogLevel> categoryLogLevel;

  @override
  List<Object?> get props => [defaultLogLevel, categoryLogLevel];

  @override
  Map<String, Object?> toJson() => _$UserLogLevelToJson(this);
}

final class _CategorySerializer implements JsonConverter<Category, String> {
  const _CategorySerializer();

  @override
  Category fromJson(String json) => Category.parse(json);

  @override
  String toJson(Category object) => object.name.screamingCase;
}

final class _LogLevelSerializer implements JsonConverter<LogLevel, String> {
  const _LogLevelSerializer();

  @override
  LogLevel fromJson(String json) => LogLevel.parse(json);

  @override
  String toJson(LogLevel object) => object.name.toUpperCase();
}
