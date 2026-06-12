import 'package:shared_preferences/shared_preferences.dart';

/// Persists the auth token using [SharedPreferences].
class TokenStorage {
  static const String _tokenKey = 'auth_token';
  static const String _tokenExpiryKey = 'token_expiry';

  final SharedPreferences _prefs;

  const TokenStorage(this._prefs);

  Future<String?> getToken() async {
    return _prefs.getString(_tokenKey);
  }

  Future<bool> isTokenExpired() async {
    final int? expiryTimestamp = _prefs.getInt(_tokenExpiryKey);

    if (expiryTimestamp == null) {
      return false;
    }

    final DateTime expiryDate =
        DateTime.fromMillisecondsSinceEpoch(expiryTimestamp);
    return DateTime.now().isAfter(expiryDate);
  }

  Future<void> saveToken(String token, {Duration? expiresIn}) async {
    await _prefs.setString(_tokenKey, token);

    if (expiresIn != null) {
      final DateTime expiryDate = DateTime.now().add(expiresIn);
      await _prefs.setInt(_tokenExpiryKey, expiryDate.millisecondsSinceEpoch);
    } else {
      await _prefs.remove(_tokenExpiryKey);
    }
  }

  Future<void> clearToken() async {
    await Future.wait([
      _prefs.remove(_tokenKey),
      _prefs.remove(_tokenExpiryKey),
    ]);
  }
}
