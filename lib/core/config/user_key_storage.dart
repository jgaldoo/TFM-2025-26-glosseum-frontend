import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserKeyStorage {
  final FlutterSecureStorage secureStorage;
  static const _key = 'userKey';

  UserKeyStorage(this.secureStorage);

  Future<String?> get() async => await secureStorage.read(key: 'username');

  Future<void> save(String value) async {
    await secureStorage.write(key: 'user_key', value: value);
  }
}
