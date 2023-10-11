import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  final _secureStorage = FlutterSecureStorage();

  // Constructor (optional)
  SecureStorageUtil();

  // Your secure storage methods will go here
  Future<void> saveSensitiveData(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getSensitiveData(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteSensitiveData(String key) async {
    await _secureStorage.delete(key: key);
  }


}
