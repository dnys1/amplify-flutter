import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';

/// {@template log_record}
/// Represents a log recorded on the native side.
/// {@endtemplate}
@immutable
class LogRecord {
  /// Whether the log was buffered or not.
  final bool buffered;

  /// The log level.
  final LogLevel level;

  /// The log message.
  final String message;

  /// The category this log corresponds to.
  final CategoryType? category;

  /// {@macro log_record}
  const LogRecord(
    this.buffered,
    this.level,
    this.message,
    this.category,
  );

  factory LogRecord.fromJson(Map json) {
    var buffered = json['buffered'] as bool;
    var logLevelInt = json['level'] as int;
    var logLevel = LogLevelX.fromJson(logLevelInt);
    var message = json['message'] as String;
    var categoryTypeStr = json['category'] as String?;
    var categoryType = categoryTypeStr == null
        ? null
        : CategoryTypeX.fromJson(categoryTypeStr);
    return LogRecord(buffered, logLevel, message, categoryType);
  }
}
