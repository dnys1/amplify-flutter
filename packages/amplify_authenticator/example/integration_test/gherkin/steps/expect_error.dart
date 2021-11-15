import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../world/authenticator_world.dart';

final thenIExpectError = then1<String, AuthenticatorWorld>(
  RegExp(r'I should (not) see an error banner'),
  (String not, StepContext<AuthenticatorWorld> context) async {
    final tester = context.world.appDriver;
    final finder = tester.findBy(MaterialBanner, FindType.type);
    if (not == 'not') {
      expect(finder, findsNothing);
    } else {
      expect(finder, findsOneWidget);
    }
  },
);
