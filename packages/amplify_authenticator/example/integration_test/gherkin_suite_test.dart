import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import 'gherkin/params/input_field_parameter.dart';
import 'gherkin/params/screen_parameter.dart';
import 'gherkin/params/test_case_parameter.dart';
import 'gherkin/steps/expect_error.dart';
import 'gherkin/steps/expect_screen.dart';
import 'gherkin/steps/input_field.dart';
import 'gherkin/steps/navigate.dart';
import 'gherkin/steps/test_case.dart';
import 'gherkin/world/authenticator_world.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite()
void main() {
  executeTestSuite(
    FlutterTestConfiguration.DEFAULT(
      [
        givenImRunningTheExample,
        thenINavigateToScreen,
        thenIExpectWidgetToBeAbsent,
        thenIExpectError,
        thenIExpectScreen,
      ],
      targetAppPath: 'test_driver/gherkin_test_driver.dart',
      featurePath: 'integration_test/features/load-configuration.feature',
    )
      ..customStepParameterDefinitions = [
        ScreenParameter(),
        TestCaseParameter(),
        InputFieldParameter(),
      ]
      ..reporters = [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        ProgressReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        TestRunSummaryReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        JsonReporter(
          writeReport: (_, __) async {},
        ),
      ]
      ..createWorld = (config) async => AuthenticatorWorld(),
    (World world) async => runApp(app),
  );
}

const app = MaterialApp(
  home: Authenticator(
    child: Text('Signed In'),
  ),
);

// ignore_for_file: avoid_print
