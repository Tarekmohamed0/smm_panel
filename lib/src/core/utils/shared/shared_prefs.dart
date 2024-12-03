import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _prefs;

  /// Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Set String
  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  /// Get String
  static String? getString(String key) {
    return _prefs.getString(key);
  }

  /// Set Integer
  static Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  /// Get Integer
  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  /// Set Boolean
  static Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  /// Get Boolean
  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  /// Set Double
  static Future<void> setDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  /// Get Double
  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  /// Set List<String>
  static Future<void> setStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  /// Get List<String>
  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  /// Check if key exists
  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  /// Remove a specific key
  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  /// Clear all keys
  static Future<void> clear() async {
    await _prefs.clear();
  }
}
