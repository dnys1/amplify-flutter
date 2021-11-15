import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/foundation.dart';
import 'package:gherkin/gherkin.dart';

class InputFieldParameter extends CustomParameter<InputField> {
  InputFieldParameter()
      : super(
          'inputField',
          RegExp('(${InputField.values.map(describeEnum).join('|')})'),
          _parse,
        );

  static InputField _parse(String inputField) {
    return InputField.values.firstWhere((el) => el.name == inputField);
  }
}
