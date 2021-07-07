/*
 * Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import 'package:amplify_auth_cognito/src/CognitoSignUp/cognito_user_attribute.dart';
import 'package:amplify_auth_plugin_interface/amplify_auth_plugin_interface.dart';

class CognitoSignUpOptions extends SignUpOptions {
  /// An optional map of arbitrary key-value pairs which will be passed to your
  /// PreAuthentication Lambda trigger as-is, used for implementing additional
  /// validations around authentication.
  ///
  /// Currently supported on `Android` only.
  final Map<String, String>? validationData;

  /// Creates a sign up configuration with the given user attributes and validation data.
  ///
  /// [userAttributes] is a map of key-value pairs, where the key is one of the standard
  /// attributes, found under [CognitoUserAttribute], or a custom attribute, created using
  /// [CognitoUserAttribute.custom()].
  ///
  /// For example:
  /// ```dart
  /// var userAttributes = <CognitoUserAttribute, String>{
  ///   CognitoUserAttribute.email: 'test@example.com',
  ///   CognitoUserAttribute.phoneNumber: '+18885551234',
  ///   CognitoUserAttribute.custom('my_attribute'): 'my_value',
  /// };
  /// var options = CognitoSignUpOptions(userAttributes: userAttributes);
  /// ```
  ///
  /// Certain [userAttributes] keys may be required depending on how your project is configured.
  /// When using email or phone verification and not using the same field for the user's login,
  /// that field is required to be included in [userAttributes].
  ///
  /// - [CognitoUserAttribute.email] is **required** if:
  ///   - One of the following are true:
  ///     - Email verification is enabled (default)
  ///     - Email was marked as a required attribute (default)
  ///   - **and** users sign up with a chosen username or phone number
  /// - [CognitoUserAttribute.phoneNumber] is **required** if:
  ///   - One of the following are true:
  ///     - MFA is ON, or manually enabled for the user
  ///     - Phone number verification is enabled
  ///     - Phone number was marked as a required attribute
  ///   - **and** users sign up with a chosen username or email
  CognitoSignUpOptions({
    Map<CognitoUserAttribute, String> userAttributes = const {},
    this.validationData,
  }) : super(
          userAttributes: Map.fromIterables(
            userAttributes.keys.map((attr) => attr.key),
            userAttributes.values,
          ),
        );

  @override
  Map<String, dynamic> serializeAsMap() {
    final Map<String, dynamic> pendingRequest = {
      'validationData': validationData,
      'userAttributes': userAttributes
    };
    pendingRequest.removeWhere((_, v) => v == null);
    return pendingRequest;
  }
}
