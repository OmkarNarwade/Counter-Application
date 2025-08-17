import 'package:hive/hive.dart';

class UserRepo {
  static Box<dynamic> get _box => Hive.box('users');

  static Future<bool> createUser({
    required String fullname,
    required String email,
    required String password,
  }) async {
    final key = email.trim();
    if (key.isEmpty || password.isEmpty || fullname.isEmpty) return false;
    if (_box.containsKey(key)) return false;
    await _box.put(key, {
      'fullname': fullname,
      'password': password,
    });
    return true;
  }

  static bool authenticate({
    required String email,
    required String password,
  }) {
    final key = email.trim();
    if (key.isEmpty || password.isEmpty) return false;
    final data = _box.get(key);
    if (data == null) return false;
    return data['password'] == password;
  }
}
