/// Base class for exceptions generated via the Amplify libraries.
abstract class AmplifyException implements Exception {
  /// The formalized type, which is expensive to compute via `runtimeType` and
  /// not always correct on Web due to minification.
  String get type;

  final String message;
  final String recoverySuggestion;
  final String? underlyingException;

  const AmplifyException(
    this.message, {
    required this.recoverySuggestion,
    this.underlyingException,
  });

  factory AmplifyException.unknown([Map? details]) =
      AmplifyUnknownException.fromMap;

  @override
  String toString() {
    var str = '''
$type { 
  message: $message, 
  recoverySuggestion: $recoverySuggestion''';
    if (underlyingException != null) {
      str += ',\n  underlyingException: $underlyingException';
    }
    return '$str\n}';
  }
}

class AmplifyUnknownException extends AmplifyException {
  @override
  String get type => 'AmplifyUnknownException';

  const AmplifyUnknownException({
    String? message,
    String? recoverySuggestion,
    String? underlyingException,
  }) : super(
          message ?? 'An unknown exception occurred.',
          recoverySuggestion: recoverySuggestion ??
              'Please report this issue and the steps to reproduce it to the '
                  'Amplify team at https://github.com/aws-amplify/amplify-flutter.',
          underlyingException: underlyingException,
        );

  AmplifyUnknownException.fromMap([Map? details])
      : this(
          message: details?['message'] as String?,
          recoverySuggestion: details?['recoverySuggestion'] as String?,
          underlyingException: details?['underlyingException'] as String?,
        );
}
