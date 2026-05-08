import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageLocalDataSource {
  Future<String> getLanguage();
  Future<void> saveLanguage(String languageCode);
}

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource{
  final SharedPreferences prefs;
  LanguageLocalDataSourceImpl(this.prefs);

  @override
  Future<String> getLanguage() async {
    return prefs.getString('language') ?? 'en';
  }
  

  @override
  Future<void> saveLanguage(String languageCode) async{
  await prefs.setString('language', languageCode);
  }
}