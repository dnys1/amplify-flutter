// Generated with smithy-dart 0.3.1. DO NOT MODIFY.
// ignore_for_file: avoid_unused_constructor_parameters,deprecated_member_use_from_same_package,non_constant_identifier_names,require_trailing_commas

library amplify_core.amplify_configuration_service.model.auth_cognito_config; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_identity_pool_config.dart';
import 'package:amplify_core/src/generated/src/amplify_configuration_service/model/auth_user_pool_config.dart';
import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i2;

part 'auth_cognito_config.g.dart';

abstract class AuthCognitoConfig
    with _i1.AWSEquatable<AuthCognitoConfig>
    implements Built<AuthCognitoConfig, AuthCognitoConfigBuilder> {
  factory AuthCognitoConfig({
    AuthUserPoolConfig? userPool,
    AuthIdentityPoolConfig? identityPool,
  }) {
    return _$AuthCognitoConfig._(
      userPool: userPool,
      identityPool: identityPool,
    );
  }

  factory AuthCognitoConfig.build(
      [void Function(AuthCognitoConfigBuilder) updates]) = _$AuthCognitoConfig;

  const AuthCognitoConfig._();

  static const List<_i2.SmithySerializer<AuthCognitoConfig>> serializers = [
    AuthCognitoConfigSerializer()
  ];

  AuthUserPoolConfig? get userPool;
  AuthIdentityPoolConfig? get identityPool;
  @override
  List<Object?> get props => [
        userPool,
        identityPool,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('AuthCognitoConfig')
      ..add(
        'userPool',
        userPool,
      )
      ..add(
        'identityPool',
        identityPool,
      );
    return helper.toString();
  }
}

class AuthCognitoConfigSerializer
    extends _i2.StructuredSmithySerializer<AuthCognitoConfig> {
  const AuthCognitoConfigSerializer() : super('AuthCognitoConfig');

  @override
  Iterable<Type> get types => const [
        AuthCognitoConfig,
        _$AuthCognitoConfig,
      ];
  @override
  Iterable<_i2.ShapeId> get supportedProtocols => const [
        _i2.ShapeId(
          namespace: 'smithy.dart',
          shape: 'genericProtocol',
        )
      ];
  @override
  AuthCognitoConfig deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AuthCognitoConfigBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final value = iterator.current;
      if (value == null) {
        continue;
      }
      switch (key) {
        case 'identityPool':
          result.identityPool.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(AuthIdentityPoolConfig),
          ) as AuthIdentityPoolConfig));
        case 'userPool':
          result.userPool.replace((serializers.deserialize(
            value,
            specifiedType: const FullType(AuthUserPoolConfig),
          ) as AuthUserPoolConfig));
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    AuthCognitoConfig object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result$ = <Object?>[];
    final AuthCognitoConfig(:identityPool, :userPool) = object;
    if (identityPool != null) {
      result$
        ..add('identityPool')
        ..add(serializers.serialize(
          identityPool,
          specifiedType: const FullType(AuthIdentityPoolConfig),
        ));
    }
    if (userPool != null) {
      result$
        ..add('userPool')
        ..add(serializers.serialize(
          userPool,
          specifiedType: const FullType(AuthUserPoolConfig),
        ));
    }
    return result$;
  }
}
