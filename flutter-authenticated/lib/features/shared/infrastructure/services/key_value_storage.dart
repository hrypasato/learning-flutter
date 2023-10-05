import 'package:shared_preferences/shared_preferences.dart';

import 'key_value_storage_service.dart';

class KeyValueStorage extends KeyValueStorageService {
  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final preferences = await getSharedPreferences();
    switch (T) {
      case int:
        return preferences.getInt(key) as T?;
      case String:
        return preferences.getString(key) as T?;
      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final preferences = await getSharedPreferences();
    return preferences.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final preferences = await getSharedPreferences();
    switch (T) {
      case int:
        preferences.setInt(key, value as int);
        break;
      case String:
        preferences.setString(key, value as String);
        break;
      default:
        throw UnimplementedError(
            'Set not implemented for type ${T.runtimeType}');
    }
  }
}
