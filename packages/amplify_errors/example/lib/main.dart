import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:amplify_errors/amplify_errors.dart';

import 'amplifyconfiguration.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  static const channel = MethodChannel('amplify_errors_example');

  Future<void> configure() async {
    try {
      await channel.invokeMethod('configure', amplifyconfig);

      scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: const Text('Succesfully configured.'),
        backgroundColor: Colors.green,
      ));
    } on PlatformException catch (e) {
      var amplifyException = parsePlatformException(e);

      // true
      print(amplifyException is AmplifyAlreadyConfiguredException);

      // AmplifyAlreadyConfiguredException {
      //  message: Amplify has already been configured.,
      //  recoverySuggestion: Remove the duplicate call to `Amplify.configure()`.
      // }
      print(amplifyException);

      scaffoldKey.currentState!.showSnackBar(SnackBar(
        content: Text(amplifyException.message),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Errors Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: configure,
            child: const Text('Configure'),
          ),
        ),
      ),
    );
  }
}
