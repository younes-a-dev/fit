import 'package:shared_preferences/shared_preferences.dart';

abstract class StartupLocalDataSource {
  Future<bool> checkFirstTime();

  Future<void> setFirstTime();
}

class StartupLocalDataSourceImpl implements StartupLocalDataSource {
  final SharedPreferences _pref;

  static const String _introCompletedKey = 'intro_completed';

  StartupLocalDataSourceImpl(this._pref);

  // Check First time
  @override
  Future<bool> checkFirstTime() async {
    // Default to true (first time) if key doesn't exist
    // final isFirstTime = _pref.getBool(_firstTimeKey) ?? false;
    final isIntroCompleted = _pref.getBool(_introCompletedKey) ?? false;
    return !isIntroCompleted;
  }

  // Set first time
  @override
  Future<void> setFirstTime() async {
    await _pref.setBool(_introCompletedKey, true);
  }
}
