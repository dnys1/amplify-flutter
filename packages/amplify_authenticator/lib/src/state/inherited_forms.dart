import 'package:amplify_authenticator/src/widgets/forms.dart';
import 'package:flutter/material.dart';

class InheritedForms extends InheritedWidget {
  // ignore: public_member_api_docs
  const InheritedForms(
      {required this.signInForm,
      required this.signUpForm,
      required this.confirmSignUpForm,
      required this.confirmSignInMFAForm,
      required this.sendCodeForm,
      required this.resetPasswordForm,
      required this.confirmSignInNewPasswordForm,
      required Widget child})
      : super(child: child);

  final SignInForm signInForm;

  final SignUpForm signUpForm;

  final ConfirmSignUpForm confirmSignUpForm;

  final ConfirmSignInMFAForm confirmSignInMFAForm;

  final SendCodeForm sendCodeForm;

  final ResetPasswordForm resetPasswordForm;

  final ConfirmSignInNewPasswordForm confirmSignInNewPasswordForm;

  //final ResetPasswordForm resetPasswordForm;

  // ignore: public_member_api_docs
  static InheritedForms? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedForms>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
