import 'amplify_exception.dart';

/// Exception thrown when Amplify has already been configured and the developer
/// tries to configure it again.
class AmplifyAlreadyConfiguredException extends AmplifyException {
  @override
  String get type => 'AmplifyAlreadyConfiguredException';

  const AmplifyAlreadyConfiguredException(
    String message, {
    required String recoverySuggestion,
    String? underlyingException,
  }) : super(
          message,
          recoverySuggestion: recoverySuggestion,
          underlyingException: underlyingException,
        );

  static AmplifyAlreadyConfiguredException fromJson(Map details) {
    return AmplifyAlreadyConfiguredException(
      details['message'] as String,
      recoverySuggestion: details['recoverySuggestion'] as String,
      underlyingException: details['underlyingException'] as String?,
    );
  }
}
