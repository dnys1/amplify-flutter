// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.model.auth_user_pool_config; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/analytics_pinpoint_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_hosted_ui_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_mfa_configuration.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_password_policy.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_username_attribute.dart';
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_collection/built_collection.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i3;

part 'auth_user_pool_config.g.dart';

abstract class AuthUserPoolConfig
    with _i1.AWSEquatable<AuthUserPoolConfig>
    implements Built<AuthUserPoolConfig, AuthUserPoolConfigBuilder> {
  factory AuthUserPoolConfig({
    required String poolId,
    required String region,
    required String clientId,
    String? clientSecret,
    Uri? endpoint,
    AuthenticationFlowType? authFlowType,
    List<AuthProvider>? socialProviders,
    List<AuthUsernameAttribute>? usernameAttributes,
    List<CognitoUserAttributeKey>? signUpAttributes,
    List<CognitoUserAttributeKey>? verificationMechanisms,
    AnalyticsPinpointConfig? pinpointConfig,
    AuthPasswordPolicy? passwordPolicy,
    AuthMfaConfiguration? mfaConfiguration,
    AuthHostedUiConfig? hostedUi,
  }) {
    return _$AuthUserPoolConfig._(
      poolId: poolId,
      region: region,
      clientId: clientId,
      clientSecret: clientSecret,
      endpoint: endpoint,
      authFlowType: authFlowType,
      socialProviders:
          socialProviders == null ? null : _i2.BuiltList(socialProviders),
      usernameAttributes:
          usernameAttributes == null ? null : _i2.BuiltList(usernameAttributes),
      signUpAttributes:
          signUpAttributes == null ? null : _i2.BuiltList(signUpAttributes),
      verificationMechanisms: verificationMechanisms == null
          ? null
          : _i2.BuiltList(verificationMechanisms),
      pinpointConfig: pinpointConfig,
      passwordPolicy: passwordPolicy,
      mfaConfiguration: mfaConfiguration,
      hostedUi: hostedUi,
    );
  }

  factory AuthUserPoolConfig.build(
          [void Function(AuthUserPoolConfigBuilder) updates]) =
      _$AuthUserPoolConfig;

  const AuthUserPoolConfig._();

  static const List<_i3.SmithySerializer<AuthUserPoolConfig>> serializers = [
    AuthUserPoolConfigSerializer()
  ];

  String get poolId;
  String get region;
  String get clientId;
  String? get clientSecret;

  /// A valid RFC 3986 URI
  Uri? get endpoint;
  AuthenticationFlowType? get authFlowType;
  _i2.BuiltList<AuthProvider>? get socialProviders;
  _i2.BuiltList<AuthUsernameAttribute>? get usernameAttributes;
  _i2.BuiltList<CognitoUserAttributeKey>? get signUpAttributes;
  _i2.BuiltList<CognitoUserAttributeKey>? get verificationMechanisms;

  /// The Amplify Analytics Pinpoint plugin configuration.
  AnalyticsPinpointConfig? get pinpointConfig;
  AuthPasswordPolicy? get passwordPolicy;
  AuthMfaConfiguration? get mfaConfiguration;
  AuthHostedUiConfig? get hostedUi;
  @override
  List<Object?> get props => [
        poolId,
        region,
        clientId,
        clientSecret,
        endpoint,
        authFlowType,
        socialProviders,
        usernameAttributes,
        signUpAttributes,
        verificationMechanisms,
        pinpointConfig,
        passwordPolicy,
        mfaConfiguration,
        hostedUi,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AuthUserPoolConfig')
      ..add(
        'poolId',
        poolId,
      )
      ..add(
        'region',
        region,
      )
      ..add(
        'clientId',
        clientId,
      )
      ..add(
        'clientSecret',
        clientSecret,
      )
      ..add(
        'endpoint',
        endpoint,
      )
      ..add(
        'authFlowType',
        authFlowType,
      )
      ..add(
        'socialProviders',
        socialProviders,
      )
      ..add(
        'usernameAttributes',
        usernameAttributes,
      )
      ..add(
        'signUpAttributes',
        signUpAttributes,
      )
      ..add(
        'verificationMechanisms',
        verificationMechanisms,
      )
      ..add(
        'pinpointConfig',
        pinpointConfig,
      )
      ..add(
        'passwordPolicy',
        passwordPolicy,
      )
      ..add(
        'mfaConfiguration',
        mfaConfiguration,
      )
      ..add(
        'hostedUi',
        hostedUi,
      );
    return helper.toString();
  }
}

class AuthUserPoolConfigSerializer
    extends _i3.StructuredSmithySerializer<AuthUserPoolConfig> {
  const AuthUserPoolConfigSerializer() : super('AuthUserPoolConfig');

  @override
  Iterable<Type> get types => const [
        AuthUserPoolConfig,
        _$AuthUserPoolConfig,
      ];
  @override
  Iterable<_i3.ShapeId> get supportedProtocols => const [
        _i3.ShapeId(
          namespace: 'smithy.dart',
          shape: 'genericProtocol',
        )
      ];
  @override
  AuthUserPoolConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthUserPoolConfigBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'authFlowType':
          result.authFlowType = (serializers.deserialize(
            value,
            specifiedType: const FullType(AuthenticationFlowType),
          ) as AuthenticationFlowType);
        case 'clientId':
          result.clientId = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'clientSecret':
          result.clientSecret = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'endpoint':
          result.endpoint = (serializers.deserialize(
            value,
            specifiedType: const FullType(Uri),
          ) as Uri);
        case 'hostedUi':
          result.hostedUi.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(AuthHostedUiConfig),
          ) as AuthHostedUiConfig));
        case 'mfaConfiguration':
          result.mfaConfiguration.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(AuthMfaConfiguration),
          ) as AuthMfaConfiguration));
        case 'passwordPolicy':
          result.passwordPolicy.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(AuthPasswordPolicy),
          ) as AuthPasswordPolicy));
        case 'pinpointConfig':
          result.pinpointConfig.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(AnalyticsPinpointConfig),
          ) as AnalyticsPinpointConfig));
        case 'poolId':
          result.poolId = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'region':
          result.region = (serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String);
        case 'signUpAttributes':
          result.signUpAttributes.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(CognitoUserAttributeKey)],
            ),
          ) as _i2.BuiltList<CognitoUserAttributeKey>));
        case 'socialProviders':
          result.socialProviders.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(AuthProvider)],
            ),
          ) as _i2.BuiltList<AuthProvider>));
        case 'usernameAttributes':
          result.usernameAttributes.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(AuthUsernameAttribute)],
            ),
          ) as _i2.BuiltList<AuthUsernameAttribute>));
        case 'verificationMechanisms':
          result.verificationMechanisms.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(
              _i2.BuiltList,
              [FullType(CognitoUserAttributeKey)],
            ),
          ) as _i2.BuiltList<CognitoUserAttributeKey>));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    AuthUserPoolConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final AuthUserPoolConfig(
      :authFlowType,
      :clientId,
      :clientSecret,
      :endpoint,
      :hostedUi,
      :mfaConfiguration,
      :passwordPolicy,
      :pinpointConfig,
      :poolId,
      :region,
      :signUpAttributes,
      :socialProviders,
      :usernameAttributes,
      :verificationMechanisms
    ) = object;
    result$.addAll([
      'clientId',
      serializers.serialize(
        clientId,
        specifiedType: const FullType(String),
      ),
      'poolId',
      serializers.serialize(
        poolId,
        specifiedType: const FullType(String),
      ),
      'region',
      serializers.serialize(
        region,
        specifiedType: const FullType(String),
      ),
    ]);
    if (authFlowType != null) {
      result$
        ..add('authFlowType')
        ..add(serializers.serialize(
          authFlowType,
          specifiedType: const FullType(AuthenticationFlowType),
        ));
    }
    if (clientSecret != null) {
      result$
        ..add('clientSecret')
        ..add(serializers.serialize(
          clientSecret,
          specifiedType: const FullType(String),
        ));
    }
    if (endpoint != null) {
      result$
        ..add('endpoint')
        ..add(serializers.serialize(
          endpoint,
          specifiedType: const FullType(Uri),
        ));
    }
    if (hostedUi != null) {
      result$
        ..add('hostedUi')
        ..add(serializers.serialize(
          hostedUi,
          specifiedType: const FullType(AuthHostedUiConfig),
        ));
    }
    if (mfaConfiguration != null) {
      result$
        ..add('mfaConfiguration')
        ..add(serializers.serialize(
          mfaConfiguration,
          specifiedType: const FullType(AuthMfaConfiguration),
        ));
    }
    if (passwordPolicy != null) {
      result$
        ..add('passwordPolicy')
        ..add(serializers.serialize(
          passwordPolicy,
          specifiedType: const FullType(AuthPasswordPolicy),
        ));
    }
    if (pinpointConfig != null) {
      result$
        ..add('pinpointConfig')
        ..add(serializers.serialize(
          pinpointConfig,
          specifiedType: const FullType(AnalyticsPinpointConfig),
        ));
    }
    if (signUpAttributes != null) {
      result$
        ..add('signUpAttributes')
        ..add(serializers.serialize(
          signUpAttributes,
          specifiedType: const FullType(
            _i2.BuiltList,
            [FullType(CognitoUserAttributeKey)],
          ),
        ));
    }
    if (socialProviders != null) {
      result$
        ..add('socialProviders')
        ..add(serializers.serialize(
          socialProviders,
          specifiedType: const FullType(
            _i2.BuiltList,
            [FullType(AuthProvider)],
          ),
        ));
    }
    if (usernameAttributes != null) {
      result$
        ..add('usernameAttributes')
        ..add(serializers.serialize(
          usernameAttributes,
          specifiedType: const FullType(
            _i2.BuiltList,
            [FullType(AuthUsernameAttribute)],
          ),
        ));
    }
    if (verificationMechanisms != null) {
      result$
        ..add('verificationMechanisms')
        ..add(serializers.serialize(
          verificationMechanisms,
          specifiedType: const FullType(
            _i2.BuiltList,
            [FullType(CognitoUserAttributeKey)],
          ),
        ));
    }
    return result$;
  }
}
