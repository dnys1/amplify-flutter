import 'auth_with_all_attributes.dart' as auth_with_all_attributes;
import 'auth_with_email.dart' as auth_with_email;

enum AuthenticatorTestCase {
  badConfig,
  confirmSignUp,
  resetPassword,
  signInFederated,
  signInForceNewPassword,
  signInSmsMfa,
  signInTotpMfa,
  signInWithEmail,
  signInWithMultiAlias,
  signInWithPhone,
  signInWithUsername,
  signUpWithEmail,
  signUpWithPhone,
  signUpWithUsername,
  verifyUser,
}

extension AuthenticatorTestCaseX on AuthenticatorTestCase {
  String get name => toString().split('.')[1];

  String get jsName {
    // Converts `signInWithEmail` to `sign-in-with-email`
    return name.splitMapJoin(RegExp('[A-Z][a-z]+'), onMatch: (m) {
      return '-' + m.group(0)!.toLowerCase();
    });
  }

  AuthenticatorConfig get config {
    switch (this) {
      case AuthenticatorTestCase.badConfig:
        return AuthenticatorConfig.emptyConfig;
      case AuthenticatorTestCase.signInWithEmail:
      case AuthenticatorTestCase.signUpWithEmail:
        return AuthenticatorConfig.authWithEmail;
      case AuthenticatorTestCase.confirmSignUp:
      case AuthenticatorTestCase.resetPassword:
      case AuthenticatorTestCase.signInFederated:
      case AuthenticatorTestCase.signInForceNewPassword:
      case AuthenticatorTestCase.signInSmsMfa:
      case AuthenticatorTestCase.signInTotpMfa:
      case AuthenticatorTestCase.signInWithMultiAlias:
      case AuthenticatorTestCase.signInWithPhone:
      case AuthenticatorTestCase.signInWithUsername:
      case AuthenticatorTestCase.signUpWithPhone:
      case AuthenticatorTestCase.signUpWithUsername:
      case AuthenticatorTestCase.verifyUser:
        throw UnimplementedError();
    }
  }

  static AuthenticatorTestCase fromJsName(String jsName) {
    return AuthenticatorTestCase.values.firstWhere((el) => el.jsName == jsName);
  }
}

class AuthenticatorConfig {
  final String amplifyConfig;

  const AuthenticatorConfig._(this.amplifyConfig);

  static const emptyConfig = AuthenticatorConfig._('{}');
  static const authWithAllAttributes =
      AuthenticatorConfig._(auth_with_all_attributes.amplifyconfig);
  static const authWithEmail =
      AuthenticatorConfig._(auth_with_email.amplifyconfig);
}
