import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_authenticator/src/screens/authenticator_screen.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../world/authenticator_world.dart';

final thenIExpectScreen = then1<AuthScreen, AuthenticatorWorld>(
  'I should see the {screen} screen',
  (AuthScreen screen, StepContext<AuthenticatorWorld> context) async {
    final tester = context.world.appDriver;
    final screenFinder = tester.findBy(AuthenticatorScreen, FindType.type);
    final screenWidget = await tester.widget<AuthenticatorScreen>(screenFinder);
    expect(screenWidget.screen, equals(screen));
  },
);
