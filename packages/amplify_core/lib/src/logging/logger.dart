import 'package:amplify_core/src/category_type.dart';

import 'log_level.dart';
export 'log_level.dart';

/// {@template logger}
/// Interface for logging in Amplify.
///
/// Users wanting to override the default logger must first implement the methods
/// on this class, then assign it to the [Amplify.logger] instance property.
/// {@endtemplate}
abstract class Logger {
  /// {@macro logger}
  const Logger();

  /// Log at the given [level].
  void log(LogLevel level, String log, [CategoryType? category]) {
    switch (level) {
      case LogLevel.verbose:
        v(log, category);
        return;
      case LogLevel.debug:
        d(log, category);
        return;
      case LogLevel.info:
        i(log, category);
        return;
      case LogLevel.warn:
        w(log, category);
        return;
      case LogLevel.error:
        e(log, category);
        return;
      case LogLevel.none:
        return;
    }
  }

  /// Log at [LogLevel.verbose].
  void v(String log, [CategoryType? category]);

  /// Log at [LogLevel.debug].
  void d(String log, [CategoryType? category]);

  /// Log at [LogLevel.info].
  void i(String log, [CategoryType? category]);

  /// Log at [LogLevel.warning].
  void w(String log, [CategoryType? category]);

  /// Log at [LogLevel.error].
  void e(String log, [CategoryType? category]);
}
