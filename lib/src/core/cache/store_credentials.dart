import 'storage.dart';

class StorageKeys {
  static const isNewUser = "session";
  static const emailKey = 'email';
  static const passWordKey = 'password';
}

class StorageCredentials {
  final Storage _storage = Storage();

  Future<bool> get newUserStatus async {
    String? checkingNewUserStatus =
        await _storage.getString(StorageKeys.isNewUser);
    return checkingNewUserStatus == "used" ? true : false;
  }
}
