import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

// TODO: delete this line
const bool USE_MOCK = true;

abstract class StartupLocalDataSource {
  Future<bool> checkLoggedIn();
  Future<bool> checkFirstTime();
  Future<void> setFirstTime();
}

class StartupLocalDataSourceImpl implements StartupLocalDataSource {
  final SharedPreferences _pref;

  // todo: uncomment when firebase is ready
  // final FirebaseAuth _auth;

  // static const String _firstTimeKey = 'is_first_time';
  static const String _introCompletedKey = 'intro_completed';

  // if using custom backend
  // static const String _authTokenKey = 'auth_token';

  StartupLocalDataSourceImpl(
    this._pref,
    // this._auth
  );

  @override
  Future<bool> checkFirstTime() async {
    // Default to true (first time) if key doesn't exist
    // final isFirstTime = _pref.getBool(_firstTimeKey) ?? false;
    final isIntroCompleted = _pref.getBool(_introCompletedKey) ?? false;
    return !isIntroCompleted;
  }

  @override
  Future<bool> checkLoggedIn() async {
    try {
      // TODO: Mock
      // if (USE_MOCK) return MOCK_LOGGED_IN;
      // Check if there's a current user in Firebase Auth
      // todo: uncomment when firebase is ready
      // final currentUser = _auth.currentUser;
      // return currentUser != null && !currentUser.isAnonymous;
      return false;
    } catch (e) {
      return false;
    }
  }


  @override
  Future<void> setFirstTime() async {
    await _pref.setBool(_introCompletedKey, true);
  }

// if using custom backend
// @override
// Future<bool> checkLoggedIn() async {
//   // Check if we have a valid auth token stored
//   final token = _prefs.getString(_authTokenKey);
//   final expiryTime = _prefs.getInt('token_expiry');
//
//   if (token == null || token.isEmpty) return false;
//   if (expiryTime != null) {
//     final now = DateTime.now().millisecondsSinceEpoch;
//     if (now > expiryTime) return false;
//   }
//
//   return true;
// }
}
