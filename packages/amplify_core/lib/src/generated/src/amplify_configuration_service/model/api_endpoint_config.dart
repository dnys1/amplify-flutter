// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.model.api_endpoint_config; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/api_authorization_mode.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/api_gateway_endpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/app_sync_endpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/rest_endpoint_config.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

sealed class ApiEndpointConfig extends _i1.SmithyUnion<ApiEndpointConfig> {
  const ApiEndpointConfig._();

  factory ApiEndpointConfig.appSync({
    required String name,
    required Uri endpoint,
    required String region,
    required ApiAuthorizationMode authMode,
    List<ApiAuthorizationMode>? additionalAuthModes,
  }) =>
      ApiEndpointConfigAppSync$(AppSyncEndpointConfig(
        name: name,
        endpoint: endpoint,
        region: region,
        authMode: authMode,
        additionalAuthModes: additionalAuthModes,
      ));

  factory ApiEndpointConfig.apiGateway({
    required String name,
    required Uri endpoint,
    required String region,
    required ApiAuthorizationMode authMode,
  }) =>
      ApiEndpointConfigApiGateway$(ApiGatewayEndpointConfig(
        name: name,
        endpoint: endpoint,
        region: region,
        authMode: authMode,
      ));

  factory ApiEndpointConfig.rest({
    required String name,
    required Uri endpoint,
  }) =>
      ApiEndpointConfigRest$(RestEndpointConfig(
        name: name,
        endpoint: endpoint,
      ));

  const factory ApiEndpointConfig.sdkUnknown(
    String name,
    Object value,
  ) = ApiEndpointConfigSdkUnknown$;

  static const List<_i1.SmithySerializer<ApiEndpointConfig>> serializers = [
    ApiEndpointConfigSerializer()
  ];

  /// Configuration for an AWS AppSync endpoint.
  AppSyncEndpointConfig? get appSync => null;

  /// Configuration for an AWS API Gateway endpoint.
  ApiGatewayEndpointConfig? get apiGateway => null;

  /// Configuration for a non-APIGW REST endpoint. Automatic authorization is not supported for these endpoints. To configure authorization, use a custom HTTP client which can add the required headers to each request.
  RestEndpointConfig? get rest => null;
  @override
  Object get value => (appSync ?? apiGateway ?? rest)!;
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper(r'ApiEndpointConfig');
    if (appSync != null) {
      helper.add(
        r'appSync',
        appSync,
      );
    }
    if (apiGateway != null) {
      helper.add(
        r'apiGateway',
        apiGateway,
      );
    }
    if (rest != null) {
      helper.add(
        r'rest',
        rest,
      );
    }
    return helper.toString();
  }
}

final class ApiEndpointConfigAppSync$ extends ApiEndpointConfig {
  const ApiEndpointConfigAppSync$(this.appSync) : super._();

  @override
  final AppSyncEndpointConfig appSync;

  @override
  String get name => 'appSync';
}

final class ApiEndpointConfigApiGateway$ extends ApiEndpointConfig {
  const ApiEndpointConfigApiGateway$(this.apiGateway) : super._();

  @override
  final ApiGatewayEndpointConfig apiGateway;

  @override
  String get name => 'apiGateway';
}

final class ApiEndpointConfigRest$ extends ApiEndpointConfig {
  const ApiEndpointConfigRest$(this.rest) : super._();

  @override
  final RestEndpointConfig rest;

  @override
  String get name => 'rest';
}

final class ApiEndpointConfigSdkUnknown$ extends ApiEndpointConfig {
  const ApiEndpointConfigSdkUnknown$(
    this.name,
    this.value,
  ) : super._();

  @override
  final String name;

  @override
  final Object value;
}

class ApiEndpointConfigSerializer
    extends _i1.StructuredSmithySerializer<ApiEndpointConfig> {
  const ApiEndpointConfigSerializer() : super('ApiEndpointConfig');

  @override
  Iterable<Type> get types => const [
        ApiEndpointConfig,
        ApiEndpointConfigAppSync$,
        ApiEndpointConfigApiGateway$,
        ApiEndpointConfigRest$,
      ];
  @override
  Iterable<_i1.ShapeId> get supportedProtocols => const [
        _i1.ShapeId(
          namespace: 'smithy.dart',
          shape: 'genericProtocol',
        )
      ];
  @override
  ApiEndpointConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final [key as String, value as Object] = serialized.toList();
    switch (key) {
      case 'appSync':
        return ApiEndpointConfigAppSync$((serializers.deserialize(
          value,
          specifiedType: const FullType(AppSyncEndpointConfig),
        ) as AppSyncEndpointConfig));
      case 'apiGateway':
        return ApiEndpointConfigApiGateway$((serializers.deserialize(
          value,
          specifiedType: const FullType(ApiGatewayEndpointConfig),
        ) as ApiGatewayEndpointConfig));
      case 'rest':
        return ApiEndpointConfigRest$((serializers.deserialize(
          value,
          specifiedType: const FullType(RestEndpointConfig),
        ) as RestEndpointConfig));
    }
    return ApiEndpointConfig.sdkUnknown(
      key,
      value,
    );
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    ApiEndpointConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return [
      object.name,
      switch (object) {
        ApiEndpointConfigAppSync$(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(AppSyncEndpointConfig),
          ),
        ApiEndpointConfigApiGateway$(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(ApiGatewayEndpointConfig),
          ),
        ApiEndpointConfigRest$(:final value) => serializers.serialize(
            value,
            specifiedType: const FullType(RestEndpointConfig),
          ),
        ApiEndpointConfigSdkUnknown$(:final value) => value,
      },
    ];
  }
}
