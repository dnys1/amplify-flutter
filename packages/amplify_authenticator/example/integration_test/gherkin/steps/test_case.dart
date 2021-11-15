import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:gherkin/gherkin.dart';

import '../../configs/configs.dart';
import '../world/authenticator_world.dart';

final givenImRunningTheExample =
    given1<AuthenticatorTestCase, AuthenticatorWorld>(
  'I run the example {testCase}',
  (
    AuthenticatorTestCase testCase,
    StepContext<AuthenticatorWorld> context,
  ) async {
    await context.world.Amplify.addPlugin(AmplifyAuthCognito());
    await context.world.Amplify.configure(testCase.config.amplifyConfig);
  },
);
