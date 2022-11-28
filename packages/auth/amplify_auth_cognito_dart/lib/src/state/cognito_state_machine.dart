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
import 'package:stream_transform/stream_transform.dart';

/// Default state machine builders for [CognitoAuthStateMachine].
@visibleForTesting
final stateMachineBuilders = <StateMachineToken, Function>{
  ConfigurationStateMachine.type: ConfigurationStateMachine.new,
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
class CognitoAuthStateMachine extends StateMachineManager<AuthEvent> {
  /// {@macro amplify_auth_cognito.cognito_auth_state_machine}
  CognitoAuthStateMachine({
    DependencyManager? dependencyManager,
  }) : super(
          stateMachineBuilders,
          dependencyManager ?? DependencyManager(defaultDependencies),
        ) {
    addInstance<CognitoAuthStateMachine>(this);
  }

  @override
  FutureOr<void> dispatch(AuthEvent event) {
    if (event is ConfigurationEvent) {
      return getOrCreate(ConfigurationStateMachine.type).add(event);
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
  }

  /// Loads credentials from the credential store (which may be
  /// outdated or expired).
  Future<CredentialStoreData> loadCredentials() async {
    final machine = getOrCreate(CredentialStoreStateMachine.type);
    final credentialsState =
        await machine.stream.startWith(machine.currentState).firstWhere(
              (state) =>
                  state is CredentialStoreSuccess ||
                  state is CredentialStoreFailure,
            );
    if (credentialsState is CredentialStoreFailure) {
      throw credentialsState.exception;
    }
    return (credentialsState as CredentialStoreSuccess).data;
  }

  /// Loads the user's current session.
  Future<CognitoAuthSession> loadSession() async {
    final machine = getOrCreate(FetchAuthSessionStateMachine.type);
    final sessionState =
        await machine.stream.startWith(machine.currentState).firstWhere(
              (state) =>
                  state is FetchAuthSessionSuccess ||
                  state is FetchAuthSessionFailure,
            );
    if (sessionState is FetchAuthSessionFailure) {
      throw sessionState.exception;
    }
    return (sessionState as FetchAuthSessionSuccess).session;
  }
}
