// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get emailAddress => 'Email Address';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get dontHaveAccount => 'Don\'t have an Account?';

  @override
  String get haveAccount => 'Already have an Account?';

  @override
  String get error => 'Error';

  @override
  String get checkYourEmail => 'Check Your Email';

  @override
  String get verificationCodeSent =>
      'We\'ve sent a 6-digit verification code to';

  @override
  String get signInTitle => 'SIGN IN';

  @override
  String get signUpTitle => 'SIGN UP';

  @override
  String get forgotYourPassword => 'Forgot your password?';

  @override
  String get resetPasswordDescription =>
      'Enter your registered email below and we\'ll send you a code to reset your password.';

  @override
  String get send => 'Send';

  @override
  String get resetCodeSent =>
      'We\'ve sent a code to your email address to reset your password';

  @override
  String get verifyCodeDescription =>
      'Please type the verification code sent to';

  @override
  String get confirm => 'Confirm';

  @override
  String get verificationCodeRequired => 'Verification code is required';

  @override
  String get verificationCodeLength => 'Code must be 6 digits';

  @override
  String get verificationCodeNumbersOnly => 'Code must contain only numbers';

  @override
  String get invalidCode => 'Invalid Code';

  @override
  String get invalidCodeMessage => 'Please enter the correct verification code';

  @override
  String get createNewPassword => 'Create a new password';

  @override
  String get createNewPasswordDescription =>
      'Enter your new password below. Make sure it\'s strong and easy for you to remember.';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get passwordChangedSuccessfully => 'Password Changed Successfully';

  @override
  String get passwordChangedSuccessfullyMessage =>
      'Your password has been updated! You can now use your new password to log in.';

  @override
  String get passwordChangeFailed => 'Oops! Something Went Wrong';

  @override
  String get passwordChangeFailedMessage =>
      'We couldn\'t update your password. Try again later';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmail => 'Enter a valid email address';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters';

  @override
  String get passwordUppercase =>
      'Password must contain at least one uppercase letter';

  @override
  String get passwordNumber => 'Password must contain at least one number';

  @override
  String get confirmPasswordRequired => 'Please confirm your password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String fieldRequired(Object fieldName) {
    return '$fieldName is required';
  }

  @override
  String get next => 'Next';

  @override
  String get back => 'Back';

  @override
  String get ok => 'OK';

  @override
  String get chooseLanguage => 'CHOOSE LANGUAGE';

  @override
  String get appName => 'Fitness App';

  @override
  String get welcome => 'Welcome';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get username => 'Username';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get other => 'Other';

  @override
  String get weekStartDay => 'Week Start Day';

  @override
  String get monday => 'Monday';

  @override
  String get saturday => 'Saturday';

  @override
  String get sunday => 'Sunday';

  @override
  String get go => 'Continue';

  @override
  String get home => 'Home';

  @override
  String get discover => 'Discover';

  @override
  String get createPlan => 'Create Plan';

  @override
  String get profile => 'Profile';

  @override
  String get coach => 'Coach';

  @override
  String get students => 'Students';

  @override
  String get findCoach => 'Find Coach';
}
