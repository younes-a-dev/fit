import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> isLoggedIn();

  Future logout();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences _prefs;

  AuthLocalDataSourceImpl(this._prefs);

  @override
  Future<bool> isLoggedIn() async {
    var token = _prefs.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
    return const Right(true);
  }
}

// Check Logged in, Firebase
// @override
// Future<bool> checkLoggedIn() async {
//   try {
//     // TODO: Mock
//     // if (USE_MOCK) return MOCK_LOGGED_IN;
//     // Check if there's a current user in Firebase Auth
//     // todo: uncomment when firebase is ready
//     // final currentUser = _auth.currentUser;
//     // return currentUser != null && !currentUser.isAnonymous;
//     return false;
//   } catch (e) {
//     return false;
//   }
// }

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
