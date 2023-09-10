// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:async';

import 'package:aws_common/aws_common.dart';

/// {@template aws_signature_v4.aws_credentials_provider_chain}
/// Attempts to load AWS credentials from a [chain] of credentials providers, in order.
/// {@endtemplate}
abstract base class AWSCredentialsProviderChain
    with AWSDebuggable, AWSLoggerMixin
    implements AWSCredentialsProvider {
  /// {@macro aws_signature_v4.aws_credentials_provider_chain}
  const AWSCredentialsProviderChain();

  /// The chain of [AWSCredentialsProvider] to iterate through.
  ///
  /// [retrieve] attempts each provider, in order, until one is successful.
  /// If none are successful, an [InvalidCredentialsException] is thrown.
  List<AWSCredentialsProvider> get chain;

  @override
  Future<AWSCredentials> retrieve() async {
    final chain = List.of(this.chain);
    for (final provider in chain) {
      final providerType = provider.runtimeTypeName;
      switch (await AWSResult.capture(provider.retrieve)) {
        case AWSSuccessResult(value: final credentials):
          logger.verbose('Successfully loaded credentials from $providerType');
          return credentials;
        case AWSErrorResult(:final exception, :final stackTrace):
          logger.verbose(
            'Failed to load credentials from $providerType',
            exception,
            stackTrace,
          );
      }
    }
    throw InvalidCredentialsException.couldNotLoad(
      'Could not load credentials using chain: '
      '[${chain.map((p) => p.runtimeTypeName).join(', ')}]',
    );
  }
}

/// {@macro aws_signature_v4.default_credentials_provider_chain}
final class AWSCredentialsProviderDefaultChain
    extends AWSCredentialsProviderChain {
  /// {@macro aws_signature_v4.default_credentials_provider_chain}
  const AWSCredentialsProviderDefaultChain({
    this.profileName,
  });

  /// The profile name to use when attempting to load from the on-disk
  /// AWS profile as part of the chain.
  final String? profileName;

  @override
  List<AWSCredentialsProvider> get chain => [
        const EnvironmentCredentialsProvider(),
        ProfileCredentialsProvider(profileName),
      ];

  @override
  String get runtimeTypeName => 'DefaultCredentialsProviderChain';
}
