import 'package:gherkin/gherkin.dart';

import '../../configs/configs.dart';

class TestCaseParameter extends CustomParameter<AuthenticatorTestCase> {
  TestCaseParameter()
      : super(
          'testCase',
          RegExp(
              '(${AuthenticatorTestCase.values.map((el) => el.jsName).join('|')})'),
          AuthenticatorTestCaseX.fromJsName,
        );
}
