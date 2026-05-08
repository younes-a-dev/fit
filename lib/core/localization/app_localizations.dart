import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;
  late Map<String, String> _strings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations(locale);
    await appLocalizations._loadStrings();
    return appLocalizations;
  }

  Future<void> _loadStrings() async {
    final String jsonString = await _loadJson();
    _strings = _parseJson(jsonString);
  }

  Future<String> _loadJson() async {
    final String languageCode = locale.languageCode;
    final String path = 'assets/translations/$languageCode.json';
    return await Future.value('{}'); // Simplified for demo
  }

  Map<String, String> _parseJson(String jsonString) {
    return {};
  }

  String translate(String key) {
    return _strings[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fa'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}