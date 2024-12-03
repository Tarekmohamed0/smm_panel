import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static final _secureStorage = FlutterSecureStorage();

  /// Write data
  static Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  /// Read data
  static Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  /// Delete a specific key
  static Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  /// Delete all keys
  static Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  /// Check if key exists
  static Future<bool> containsKey(String key) async {
    final allKeys = await _secureStorage.readAll();
    return allKeys.containsKey(key);
  }

  /// Read all keys and values
  static Future<Map<String, String>> readAll() async {
    return await _secureStorage.readAll();
  }
}
