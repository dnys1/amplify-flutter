/// User attributes available for configuring via `Amplify.Auth.signUp`,
/// or updating via `Amplify.Auth.updateUserAttribute` and
/// `Amplify.Auth.updateUserAttributes`.
///
/// More information about the standard attributes can be found
/// [here](https://docs.aws.amazon.com/cognito/latest/developerguide/user-pool-settings-attributes.html).
///
/// Custom attributes can be created using [CognitoUserAttribute.custom()].
class CognitoUserAttribute {
  final String key;

  const CognitoUserAttribute._(this.key);

  /// Creates a custom user attribute for [key].
  const CognitoUserAttribute.custom(String key) : this._('custom:$key');

  static const address = CognitoUserAttribute._('address');
  static const email = CognitoUserAttribute._('email');
  static const familyName = CognitoUserAttribute._('family_name');
  static const gender = CognitoUserAttribute._('gender');
  static const givenName = CognitoUserAttribute._('given_name');
  static const locale = CognitoUserAttribute._('locale');
  static const middleName = CognitoUserAttribute._('middle_name');
  static const name = CognitoUserAttribute._('name');
  static const nickname = CognitoUserAttribute._('nickname');
  static const phoneNumber = CognitoUserAttribute._('phone_number');
  static const picture = CognitoUserAttribute._('picture');
  static const preferredUsername = CognitoUserAttribute._('preferred_username');
  static const profile = CognitoUserAttribute._('profile');
  static const updatedAt = CognitoUserAttribute._('updated_at');
  static const website = CognitoUserAttribute._('website');
  static const zoneinfo = CognitoUserAttribute._('zoneinfo');

  @override
  String toString() => 'CognitoUserAttribute.$key';
}
