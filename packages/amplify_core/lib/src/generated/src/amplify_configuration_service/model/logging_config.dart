// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.model.logging_config; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/amplify_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/amplify_logging_constraints.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/logging_cloud_watch_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/logging_remote_config.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class LoggingConfig extends _i1.SmithyUnion<LoggingConfig> {
  const LoggingConfig._();

  factory LoggingConfig.cloudWatch({
    required String logGroupName,
    required String region,
    bool? enable,
    LocalStorageSize? localStoreMaxSize,
    Duration? flushInterval,
    LoggingRemoteConfig? defaultRemoteConfiguration,
    AmplifyLoggingConstraints? loggingConstraints,
  }) =>
      LoggingConfigCloudWatch$(LoggingCloudWatchConfig(
        logGroupName: logGroupName,
        region: region,
        enable: enable,
        localStoreMaxSize: localStoreMaxSize,
        flushInterval: flushInterval,
        defaultRemoteConfiguration: defaultRemoteConfiguration,
        loggingConstraints: loggingConstraints,
      ));

  const factory LoggingConfig.sdkUnknown(
    String name,
    Object value,
  ) = LoggingConfigSdkUnknown$;

  static const List<_i1.SmithySerializer<LoggingConfig>> serializers = [
    LoggingConfigSerializer()
  ];

  LoggingCloudWatchConfig? get cloudWatch => null;
  @override
  Object get value => (cloudWatch)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'LoggingConfig');
    if (cloudWatch != null) {
      helper.add(
        r'cloudWatch',
        cloudWatch,
      );
    }
    return helper.toString();
  }
}

final class LoggingConfigCloudWatch$ extends LoggingConfig {
  const LoggingConfigCloudWatch$(this.cloudWatch) : super._();

  @override
  final LoggingCloudWatchConfig cloudWatch;

  @override
  String get name => 'cloudWatch';
}

final class LoggingConfigSdkUnknown$ extends LoggingConfig {
  const LoggingConfigSdkUnknown$(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class LoggingConfigSerializer
    extends _i1.StructuredSmithySerializer<LoggingConfig> {
  const LoggingConfigSerializer() : super('LoggingConfig');

  @override
  Iterable<Type> get types => const [
        LoggingConfig,
        LoggingConfigCloudWatch$,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'smithy.dart',
          shape: 'genericProtocol',
        )
      ];
  @override
  LoggingConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'cloudWatch':
        return LoggingConfigCloudWatch$((serializers.deserialize(
          value,
          specifiedType: const FullType(LoggingCloudWatchConfig),
        ) as LoggingCloudWatchConfig));
    }
    return LoggingConfig.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    LoggingConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        LoggingConfigCloudWatch$(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(LoggingCloudWatchConfig),
          ),
        LoggingConfigSdkUnknown$(:final value) => value,
      },
    ];
  }
}
