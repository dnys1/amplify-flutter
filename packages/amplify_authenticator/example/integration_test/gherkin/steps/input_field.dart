import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../world/authenticator_world.dart';

final thenIExpectWidgetToBeAbsent = then1<String, AuthenticatorWorld>(
  'I expect the widget {string} to be absent',
  (String key, StepContext<AuthenticatorWorld> context) async {
    final widgetFinder = context.world.appDriver.findBy(Key(key), FindType.key);
    expect(widgetFinder, findsNothing);
  },
);
