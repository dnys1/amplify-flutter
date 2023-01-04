// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';

import 'package:amplify_auth_cognito_dart/amplify_auth_cognito_dart.dart';
import 'package:amplify_auth_cognito_dart/src/credentials/auth_plugin_credentials_provider.dart';
import 'package:amplify_auth_cognito_dart/src/credentials/device_metadata_repository.dart';
import 'package:amplify_auth_cognito_dart/src/state/state.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

/// Default state machine builders for [CognitoAuthStateMachine].
@visibleForTesting
final stateMachineBuilders = <StateMachineToken, StateMachineBuilder>{
  AuthStateMachine.type: AuthStateMachine.new,
  CredentialStoreStateMachine.type: CredentialStoreStateMachine.new,
  FetchAuthSessionStateMachine.type: FetchAuthSessionStateMachine.new,
  HostedUiStateMachine.type: HostedUiStateMachine.new,
  SignUpStateMachine.type: SignUpStateMachine.new,
  SignInStateMachine.type: SignInStateMachine.new,
};

AWSHttpClient _makeAwsHttpClient() =>
    AmplifyHttpClient()..supportedProtocols = SupportedProtocols.http1;

/// Default defaultDependencies for [CognitoAuthStateMachine].
@visibleForTesting
final defaultDependencies = <Token, DependencyBuilder>{
  HostedUiPlatform.token: HostedUiPlatform.new,
  const Token<http.Client>(): http.Client.new,
  const Token<AWSHttpClient>(): _makeAwsHttpClient,
  AuthPluginCredentialsProvider.token: AuthPluginCredentialsProviderImpl.new,
  DeviceMetadataRepository.token: DeviceMetadataRepository.new,
};

/// {@template amplify_auth_cognito.cognito_auth_state_machine}
/// The state machine for managing auth state and relevant work.
/// {@endtemplate}
class CognitoAuthStateMachine extends StateMachineManager {
  /// {@macro amplify_auth_cognito.cognito_auth_state_machine}
  CognitoAuthStateMachine({
    DependencyManager? dependencyManager,
  }) : super(
          stateMachineBuilders,
          dependencyManager ?? DependencyManager(defaultDependencies),
        );

  @override
  FutureOr<void> dispatch(StateMachineEvent<dynamic, dynamic> event) async {
    try {
      if (event is AuthEvent) {
        return getOrCreate(AuthStateMachine.type).add(event);
      } else if (event is CredentialStoreEvent) {
        return getOrCreate(CredentialStoreStateMachine.type).add(event);
      } else if (event is FetchAuthSessionEvent) {
        return getOrCreate(FetchAuthSessionStateMachine.type).add(event);
      } else if (event is HostedUiEvent) {
        return getOrCreate(HostedUiStateMachine.type).add(event);
      } else if (event is SignUpEvent) {
        return getOrCreate(SignUpStateMachine.type).add(event);
      } else if (event is SignInEvent) {
        return getOrCreate(SignInStateMachine.type).add(event);
      }
      throw StateError('Unhandled event: $event');
    } finally {
      // Allow propogation of event
      await Future<void>.delayed(Duration.zero);
    }
  }
}
