/*
 * Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
import 'package:amplify_api_plugin_interface/src/auth/api_authorization_type.dart';

/// {@template auth_token}
/// An authorization token for use with an [APIAuthProvider]. If [expiration]
/// is not provided, the token is assumed to not expire.
/// {@endtemplate}
class AuthToken {
  /// The authorization type this token is valid for.
  final APIAuthorizationType type;

  /// The authorization token, or `null` if unavailable.
  final String? token;

  /// {@macro auth_token}
  const AuthToken(this.type, this.token);

  /// Returns `this` as a serialized [Map].
  Map<String, dynamic> toMap() => {
        'type': type.rawValue,
        'token': token,
      };
}

/// Handles the retrieval of authentication tokens for third-party providers.
///
/// Users should subclass one of:
/// - [OIDCAuthProvider]: Handles OIDC authorization
/// - [FunctionAuthProvider]: Handles Custom Function authorization
///
/// For more information about the different authorization modes, see the
/// [docs](https://docs.amplify.aws/cli/graphql-transformer/auth).
abstract class APIAuthProvider {
  /// The authorization type of this provider.
  final APIAuthorizationType type;

  const APIAuthProvider._(this.type);

  /// Returns the latest authorization token, or `null` if unavailable.
  /// If an [Exception] is thrown, it will be treated the same as a `null` token.
  /// However, [Error] objects will not be caught and must be handled by the
  /// developer.
  Future<String?> getLatestAuthToken();
}

/// {@template oidc_auth_provider}
/// Handles the retrieval of tokens for OIDC-protected API calls.
/// {@endtemplate}
abstract class OIDCAuthProvider extends APIAuthProvider {
  /// {@macro oidc_auth_provider}
  const OIDCAuthProvider() : super._(APIAuthorizationType.oidc);
}

/// {@template function_auth_provider}
/// Handles the retrieval of tokens for Custom Function-protected API calls.
/// {@endtemplate}
abstract class FunctionAuthProvider extends APIAuthProvider {
  /// {@macro function_auth_provider}
  const FunctionAuthProvider() : super._(APIAuthorizationType.function);
}
