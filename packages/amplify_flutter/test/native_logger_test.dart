import 'dart:async';

import 'package:amplify_flutter/src/logging/native_logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Native -> Dart JSON event controller.
  final _eventController = StreamController<dynamic>.broadcast();

  setUp(() async {
    final eventChannelName = NativeLogger.eventChannelName;
    final eventChannel = MethodChannel(NativeLogger.eventChannelName);

    eventChannel.setMockMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'listen':
          ServicesBinding.instance!.defaultBinaryMessenger
              .handlePlatformMessage(
            eventChannelName,
            eventChannel.codec.encodeSuccessEnvelope(null),
            (data) {},
          );
          break;
        case 'cancel':
          await _eventController.close();
          break;
      }
      return null;
    });
  });
}
