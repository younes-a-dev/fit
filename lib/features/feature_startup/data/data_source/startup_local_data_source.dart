import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/app_state_model.dart';

abstract class StartupLocalDataSource {
  Future<bool> checkFirstTime();
  Future<void> setFirstTime();
  Future<void> saveAppState(AppStateModel model);
  Future<AppStateModel?> getCachedAppState();
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

  @override
  Future<void> saveAppState(AppStateModel model) async {
    await _pref.setString('app_state', jsonEncode(model.toJson()));
  }

  @override
  Future<AppStateModel?> getCachedAppState() async {
    final json = _pref.getString('app_state');
    if (json == null) return null;
    return AppStateModel.fromJson(jsonDecode(json));
  }
}
