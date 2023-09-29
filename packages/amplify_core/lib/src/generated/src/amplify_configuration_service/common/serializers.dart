// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.common.serializers; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/amplify_logging_constraints.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/amplify_sub_category.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/analytics_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/analytics_pinpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/api_authorization_mode.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/api_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/api_endpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/api_gateway_endpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/app_sync_endpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_cognito_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_hosted_ui_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_identity_pool_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_mfa_configuration.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_password_policy.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_provider_custom.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_provider_oidc.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_provider_saml.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_user_pool_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_username_attribute.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/logging_cloud_watch_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/logging_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/logging_remote_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/notifications_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/push_notifications_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/push_notifications_pinpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/rest_endpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/storage_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/storage_s3_bucket.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/storage_s3_config.dart';
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i1;

const List<_i1.SmithySerializer> serializers = [
  ...AmplifyLoggingConstraints.serializers,
  ...AmplifySubCategory.serializers,
  ...AnalyticsPinpointConfig.serializers,
  ...AnalyticsConfig.serializers,
  ...ApiAuthorizationMode.serializers,
  ...AppSyncEndpointConfig.serializers,
  ...ApiGatewayEndpointConfig.serializers,
  ...RestEndpointConfig.serializers,
  ...ApiEndpointConfig.serializers,
  ...ApiConfig.serializers,
  ...AuthProviderOidc.serializers,
  ...AuthProviderSaml.serializers,
  ...AuthProviderCustom.serializers,
  ...AuthUsernameAttribute.serializers,
  ...AuthPasswordPolicy.serializers,
  ...AuthMfaConfiguration.serializers,
  ...AuthHostedUiConfig.serializers,
  ...AuthUserPoolConfig.serializers,
  ...AuthIdentityPoolConfig.serializers,
  ...AuthCognitoConfig.serializers,
  ...AuthConfig.serializers,
  ...LoggingRemoteConfig.serializers,
  ...LoggingCloudWatchConfig.serializers,
  ...LoggingConfig.serializers,
  ...PushNotificationsPinpointConfig.serializers,
  ...PushNotificationsConfig.serializers,
  ...NotificationsConfig.serializers,
  ...StorageS3Bucket.serializers,
  ...StorageS3Config.serializers,
  ...StorageConfig.serializers,
];
final Map<FullType, Function> builderFactories = {
  const FullType(
    _i2.BuiltMap,
    [
      FullType(Category),
      FullType(LogLevel),
    ],
  ): _i2.MapBuilder<Category, LogLevel>.new,
  const FullType(
    _i2.BuiltMap,
    [
      FullType(String),
      FullType(UserLogLevel),
    ],
  ): _i2.MapBuilder<String, UserLogLevel>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(ApiAuthorizationMode)],
  ): _i2.ListBuilder<ApiAuthorizationMode>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(ApiEndpointConfig)],
  ): _i2.ListBuilder<ApiEndpointConfig>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(Uri)],
  ): _i2.ListBuilder<Uri>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(String)],
  ): _i2.ListBuilder<String>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(AuthProvider)],
  ): _i2.ListBuilder<AuthProvider>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(AuthUsernameAttribute)],
  ): _i2.ListBuilder<AuthUsernameAttribute>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(CognitoUserAttributeKey)],
  ): _i2.ListBuilder<CognitoUserAttributeKey>.new,
  const FullType(
    _i2.BuiltList,
    [FullType(StorageS3Bucket)],
  ): _i2.ListBuilder<StorageS3Bucket>.new,
};
