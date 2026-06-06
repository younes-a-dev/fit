import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> isLoggedIn();
  Future<void> saveToken(String token);
  Future<void> logout();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences _prefs;

  AuthLocalDataSourceImpl(this._prefs);

  @override
  Future<bool> isLoggedIn() async {
    final token = _prefs.getString('token');
    if (token == null || token.isEmpty) return false;

    // Check token expiration if stored
    final expiryTime = _prefs.getInt('token_expiry');
    if (expiryTime != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (now > expiryTime) {
        await logout(); // Auto-cleanup expired token
        return false;
      }
    }
    return true;
  }

  @override
  Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  @override
  Future<void> logout() async {
    await _prefs.remove('token');
  }
}