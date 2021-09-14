import 'package:amplify_core/amplify_core.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/foundation.dart';

/// The default logging level used throughout Amplify.
const LogLevel kDefaultLogLevel = LogLevel.warn;

/// {@template default_logger}
/// The default logger in Amplify, which prints all logs at [Amplify.logLevel]
/// or above to the console, in debug mode.
/// {@endtemplate}
class DefaultLogger extends Logger {
  /// {@macro default_logger}
  const DefaultLogger();

  /// Logs emitted below this level will not be printed to the console.
  LogLevel get logLevel => Amplify.logLevel;

  /// Prints logs in debug mode, only.
  void _safePrint(String log) {
    if (kReleaseMode) return;
    print(log);
  }

  /// Constructs a printable message from the parameters.
  String _buildMessage(LogLevel level, CategoryType? category, String log) =>
      '[${level.debugString}] ${category?.displayName ?? 'Amplify'}: $log';

  @override
  void v(String log, [CategoryType? category]) {
    if (logLevel >= LogLevel.debug) {
      final msg = _buildMessage(LogLevel.verbose, category, log);
      _safePrint(msg);
    }
  }

  @override
  void d(String log, [CategoryType? category]) {
    if (logLevel >= LogLevel.debug) {
      final msg = _buildMessage(LogLevel.debug, category, log);
      _safePrint(msg);
    }
  }

  @override
  void i(String log, [CategoryType? category]) {
    if (logLevel >= LogLevel.info) {
      final msg = _buildMessage(LogLevel.info, category, log);
      _safePrint(msg);
    }
  }

  @override
  void w(String log, [CategoryType? category]) {
    if (logLevel >= LogLevel.warn) {
      final msg = _buildMessage(LogLevel.warn, category, log);
      _safePrint(msg);
    }
  }

  @override
  void e(String log, [CategoryType? category]) {
    if (logLevel >= LogLevel.error) {
      final msg = _buildMessage(LogLevel.error, category, log);
      _safePrint(msg);
    }
  }
}
