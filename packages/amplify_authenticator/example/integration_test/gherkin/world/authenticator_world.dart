import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_test_flutter/amplify_test_flutter.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class AuthenticatorWorld extends FlutterWidgetTesterWorld {
  // ignore: non_constant_identifier_names
  AmplifyClass Amplify = AmplifyClass.protected();

  Future<void> reset() async {
    AmplifyTestFlutter.reset();
    Amplify = AmplifyClass.protected();
  }
}
