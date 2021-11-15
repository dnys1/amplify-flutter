import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/foundation.dart';
import 'package:gherkin/gherkin.dart';

class ScreenParameter extends CustomParameter<AuthScreen> {
  ScreenParameter()
      : super(
          'screen',
          RegExp('(${AuthScreen.values.map(describeEnum).join('|')})'),
          _parse,
        );

  static AuthScreen _parse(String screen) {
    return AuthScreen.values.firstWhere((el) => describeEnum(el) == screen);
  }
}
