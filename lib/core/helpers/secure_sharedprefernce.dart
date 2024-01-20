import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences prefs;
  static const String _tokenKey = 'token';

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String token) async {
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    return prefs.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    await prefs.remove(_tokenKey);
  }
}
