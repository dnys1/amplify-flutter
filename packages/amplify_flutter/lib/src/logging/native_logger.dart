import 'dart:async';
import 'dart:convert';

import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'log_record.dart';

class InvalidArgumentException implements Exception {
  final Type expected;
  final Type got;

  const InvalidArgumentException(this.expected, this.got);

  @override
  String toString() {
    return 'Invalid arguments: Expected: $expected. Got: $got.';
  }
}

/// Handles log passing from Native -> Dart.
abstract class NativeLogger {
  @visibleForTesting
  static const eventChannelName =
      'com.amazonaws.amplify/flutter/logging/events';

  @visibleForTesting
  static const methodChannelName = 'com.amazonaws.amplify/flutter/logging';

  static const _eventChannel = EventChannel(
    eventChannelName,
    const JSONMethodCodec(),
  );
  static const _methodChannel = MethodChannel(methodChannelName);

  /// Incoming stream of log events.
  static Stream<Object?>? _loggerStream;

  /// Whether the logger has been set up yet.
  static bool get _configured => _loggerStream != null;

  @visibleForTesting
  static LogRecord parseEvent(Object? json) {
    if (json is! Map) {
      throw InvalidArgumentException(Map, json.runtimeType);
    }
    return LogRecord.fromJson(json);
  }

  /// Logs errors occurring internally and re-configures the logger.
  static void _logError(Object error) {
    Amplify.e('$error');
    _loggerStream = null;
    configure(Amplify.logLevel);
  }

  /// Sets up the native logger with the given [level].
  ///
  /// May be called multiple times to change the native log level.
  static void configure(LogLevel level) {
    if (_configured) return;
    try {
      Amplify.i('Configuring with log level: $level');
      _loggerStream = _eventChannel.receiveBroadcastStream(level.rawValue);
      _loggerStream!.listen(
        (event) {
          final logRecord = parseEvent(event);
          var message = logRecord.message;
          if (logRecord.buffered) {
            message = '(Buffered) $message';
          }
          Amplify.log(logRecord.level, message, logRecord.category);
        },
        cancelOnError: true,
        onError: _logError,
      );
    } on PlatformException catch (e) {
      Amplify.e('Configuring native logger failed: $e');
    }
  }

  /// Reconfigures the log level for the native logger.
  static Future<void> setLogLevel(LogLevel level) async {
    try {
      await _methodChannel.invokeMethod<void>('setLogLevel', level.rawValue);
    } on PlatformException catch (e) {
      _logError(e);
    }
  }
}
