/// The levels for logging within Amplify.
enum LogLevel {
  /// No logs.
  none,

  /// Exceptions or errors which should be handled by the developer.
  error,

  /// Deprecation warnings and other items which may cause a problem in the future.
  warn,

  /// High-level process information about Amplify's current state.
  info,

  /// Information for developers, low-level tidbits.
  debug,

  /// All logs.
  verbose,
}

/// Comparison operators and heleprs for [LogLevel].
extension LogLevelX on LogLevel {
  bool operator >(LogLevel other) => index > other.index;
  bool operator >=(LogLevel other) => index >= other.index;
  bool operator <(LogLevel other) => index < other.index;
  bool operator <=(LogLevel other) => index <= other.index;

  /// Name of the log level.
  String get name => toString().split('.')[1];

  /// String used for identifying logs printed to the console.
  String get debugString => name.toUpperCase();

  /// The integer value of the log level which corresponds with native log levels,
  /// or `null` if [LogLevel.none].
  int? get rawValue => this == LogLevel.none ? null : index - 1;

  /// Used in `fromJson` handlers for deserializing log levels.
  ///
  /// Throws [StateError] if [level] is not valid.
  static LogLevel fromJson(int level) =>
      LogLevel.values.firstWhere((e) => e.rawValue == level);
}
