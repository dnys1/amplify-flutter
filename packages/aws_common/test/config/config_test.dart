// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:aws_common/aws_common.dart';
import 'package:aws_common/src/config/aws_path_provider.dart';
import 'package:test/test.dart';

void main() {
  AWSLogger().logLevel = LogLevel.verbose;

  group('AWSConfig', () {
    final logCollector = _LogCollector();

    setUpAll(() {
      AWSLogger().registerPlugin(logCollector);
    });

    tearDown(logCollector.logs.clear);

    group('shared', () {
      test('load shared', () async {
        final config = await overrideEnvironment({}, () => AWSConfig.shared());
        expect(
          config.credentialsProvider,
          isA<AWSCredentialsProviderDefaultChain>(),
        );
        expect(config.region, isNull);
        expect(config.endpoint, isNull);
        expect(config.httpClient, isNull);
      });

      test('runtime overrides', () async {
        final config = await overrideEnvironment(
          {},
          () => AWSConfig.shared
              .withRegion(const AWSRegion('us-west-4'))
              .withProfileName('custom')
              .withEndpoint(Uri.parse('http://example.com'))
              .load(),
        );
        expect(
          config.credentialsProvider,
          isA<AWSCredentialsProviderDefaultChain>(),
        );
        expect(config.region, const AWSRegion('us-west-4'));
        expect(config.endpoint, Uri.parse('http://example.com'));
        expect(config.httpClient, isNull);
      });

      test('environment overrides', () async {
        await overrideEnvironment(
          {
            'AWS_REGION': 'us-west-2',
            'AWS_ACCESS_KEY_ID': 'akid',
            'AWS_SECRET_ACCESS_KEY': 'secret',
          },
          () async {
            final config = await AWSConfig.shared();
            expect(config.region, AWSRegion.usWest2);
            await expectLater(
              config.credentialsProvider.retrieve(),
              completion(const AWSCredentials('akid', 'secret')),
            );
            expect(config.httpClient, isNull);
          },
        );
      });
    });
  });
}

final class _LogCollector extends AWSLoggerPlugin {
  final logs = <String>[];

  @override
  void handleLogEntry(LogEntry logEntry) {
    logs.add(logEntry.message);
  }
}
