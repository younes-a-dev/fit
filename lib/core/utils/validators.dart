import '../localization/l10n/app_localizations.dart';

class Validators {
  const Validators._();

  static String? email(String? value, AppLocalizations l10n) {
    if (value == null || value.trim().isEmpty) {
      return l10n.emailRequired;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return l10n.invalidEmail;
    }

    return null;
  }

  static String? password(String? value, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.passwordRequired;
    }

    if (value.length < 8) {
      return l10n.passwordMinLength;
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return l10n.passwordUppercase;
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return l10n.passwordNumber;
    }

    return null;
  }

  static String? confirmPassword(
      String? value, String original, AppLocalizations l10n) {
    if (value == null || value.isEmpty) {
      return l10n.confirmPasswordRequired;
    }
    if (value != original) {
      return l10n.passwordsDoNotMatch;
    }
    return null;
  }

  static String? required(String? value, AppLocalizations l10n,
      {String fieldName = ''}) {
    if (value == null || value.trim().isEmpty) {
      return l10n.fieldRequired(fieldName);
    }
    return null;
  }
}
