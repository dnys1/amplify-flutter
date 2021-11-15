// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner(
    TestConfiguration configuration,
    Future<void> Function(World) appMainFunction,
  ) : super(configuration, appMainFunction);

  @override
  void onRun() {
    testFeature0();
    testFeature1();
  }

  void testFeature0() {
    runFeature(
      'Sign Up with Email:',
      <String>[],
      () {
        runScenario(
          'Login mechanism set to "email"',
          <String>[],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I run the example "sign-up-with-email"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I tap the "goToSignUpButton" button',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I should see the "signup" screen',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I expect the widget "emailSignUpFormField" to be present within 1 second',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I expect the widget "usernameSignUpFormField" to be absent',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I expect the widget "phoneNumberSignUpFormField" to be absent',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Login mechanism set to "email"',
            <String>[],
          ),
          onAfter: () async => onAfterRunFeature(
            'Login mechanism set to "email"',
          ),
        );
      },
    );
  }

  void testFeature1() {
    runFeature(
      'Load Configuration:',
      <String>[],
      () {
        runScenario(
          'Successfully configures for valid configuration',
          <String>[],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I run the example "sign-in-with-email"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I should see the "signin" screen',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'And I should not see an error banner',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Successfully configures for valid configuration',
            <String>[],
          ),
          onAfter: null,
        );

        runScenario(
          'Shows an error for an invalid configuration',
          <String>[],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I run the example "bad-config"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I should see an error banner',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: null,
          onAfter: () async => onAfterRunFeature(
            'Shows an error for an invalid configuration',
          ),
        );
      },
    );
  }
}

void executeTestSuite(
  TestConfiguration configuration,
  Future<void> Function(World) appMainFunction,
) {
  _CustomGherkinIntegrationTestRunner(configuration, appMainFunction).run();
}
