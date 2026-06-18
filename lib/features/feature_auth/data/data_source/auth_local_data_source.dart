import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> isLoggedIn();

  Future<void> saveSession({
    required String accessToken,
    required String refreshToken,
  });

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> logout();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferences _prefs;

  AuthLocalDataSourceImpl(this._prefs);

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  @override
  Future<bool> isLoggedIn() async {
    return _prefs.containsKey(_accessTokenKey);
    // final token = _prefs.getString('token');
    // if (token == null || token.isEmpty) return false;
    //
    // // Check token expiration if stored
    // final expiryTime = _prefs.getInt('token_expiry');
    // if (expiryTime != null) {
    //   final now = DateTime.now().millisecondsSinceEpoch;
    //   if (now > expiryTime) {
    //     await logout(); // Auto-cleanup expired token
    //     return false;
    //   }
    // }
    // return true;
  }

  @override
  Future<void> saveSession(
      {required String accessToken, required String refreshToken}) async {
    await _prefs.setString(_accessTokenKey, accessToken);
    await _prefs.setString(_refreshTokenKey, refreshToken);
  }

  @override
  Future<String?> getAccessToken() async{
    return _prefs.getString(_accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _prefs.getString(_refreshTokenKey);
  }

  @override
  Future<void> logout() async {
    await _prefs.remove(_accessTokenKey);
    await _prefs.remove(_refreshTokenKey);
  }
}