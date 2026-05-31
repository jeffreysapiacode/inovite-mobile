import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Create an instance of the storage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Write data
  Future<void> writeToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  // Read data
  Future<String?> readToken() async {
    return await _storage.read(key: 'auth_token');
  }

  // Delete data
  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }

  // Check if a key exists
  Future<bool> hasToken() async {
    return await _storage.containsKey(key: 'auth_token');
  }
}
