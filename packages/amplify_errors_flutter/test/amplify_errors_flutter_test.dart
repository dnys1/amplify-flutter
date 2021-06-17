import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:amplify_errors_flutter/amplify_errors_flutter.dart';

void main() {
  const channel = MethodChannel('amplify_errors_flutter');
  const alreadyConfiguredException = <String, dynamic>{
    'message': 'Amplify has already been configured.',
    'recoverySuggestion': 'Remove duplicate calls to Amplify.configure',
  };

  TestWidgetsFlutterBinding.ensureInitialized();

  group('iOS', () {
    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(
          code: 'ConfigurationError.amplifyAlreadyConfigured',
          details: alreadyConfiguredException,
        );
      });
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
    });

    test('configure', () async {
      try {
        await channel.invokeMethod('configure');
        fail('Should throw');
      } on Exception catch (e) {
        expect(e, isA<PlatformException>());

        var convertedError = parsePlatformException(e as PlatformException);
        expect(convertedError, isA<AmplifyAlreadyConfiguredException>());
      }
    });
  });

  group('Android', () {
    setUp(() {
      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        throw PlatformException(
          code: r'com.amplifyframework.core.Amplify$AlreadyConfiguredException',
          details: alreadyConfiguredException,
        );
      });
    });

    tearDown(() {
      channel.setMockMethodCallHandler(null);
    });

    test('configure', () async {
      try {
        await channel.invokeMethod('configure');
        fail('Should throw');
      } on Exception catch (e) {
        expect(e, isA<PlatformException>());

        var convertedError = parsePlatformException(e as PlatformException);
        expect(convertedError, isA<AmplifyAlreadyConfiguredException>());
      }
    });
  });
}
