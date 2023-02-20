// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library amplify_codegen.codegen_plugin_service.model.auth_provider; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:smithy/smithy.dart' as _i1;

class AuthProvider extends _i1.SmithyEnum<AuthProvider> {
  const AuthProvider._(
    int index,
    String name,
    String value,
  ) : super(
          index,
          name,
          value,
        );

  const AuthProvider._sdkUnknown(String value) : super.sdkUnknown(value);

  static const amazonCognitoUserPools = AuthProvider._(
    0,
    'AMAZON_COGNITO_USER_POOLS',
    'userPools',
  );

  static const apiKey = AuthProvider._(
    1,
    'API_KEY',
    'apiKey',
  );

  static const awsIam = AuthProvider._(
    2,
    'AWS_IAM',
    'iam',
  );

  static const function = AuthProvider._(
    3,
    'FUNCTION',
    'function',
  );

  static const openidConnect = AuthProvider._(
    4,
    'OPENID_CONNECT',
    'oidc',
  );

  /// All values of [AuthProvider].
  static const values = <AuthProvider>[
    AuthProvider.amazonCognitoUserPools,
    AuthProvider.apiKey,
    AuthProvider.awsIam,
    AuthProvider.function,
    AuthProvider.openidConnect,
  ];

  static const List<_i1.SmithySerializer<AuthProvider>> serializers = [
    _i1.SmithyEnumSerializer(
      'AuthProvider',
      values: values,
      sdkUnknown: AuthProvider._sdkUnknown,
      supportedProtocols: [
        _i1.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restJson1',
        )
      ],
    )
  ];
}

extension AuthProviderHelpers on List<AuthProvider> {
  /// Returns the value of [AuthProvider] whose name matches [name].
  ///
  /// Throws a `StateError` if no matching value is found.
  AuthProvider byName(String name) =>
      firstWhere((el) => el.name.toLowerCase() == name.toLowerCase());

  /// Returns the value of [AuthProvider] whose value matches [value].
  AuthProvider byValue(String value) => firstWhere((el) => el.value == value);
}
