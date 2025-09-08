import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final SharedPreferences prefs;

  SharedPrefService({required this.prefs});

  Future<void> setValue<T>(String key, T value) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw Exception("Unsupported type");
    }
  }

  T? getValue<T>(String key) {
    final value = prefs.get(key);
    if (value is T) {
      return value;
    }
    return null;
  }

  Future<void> removeValue(String key) async {
    await prefs.remove(key);
  }

  Future<void> clearAll() async {
    await prefs.clear();
  }
}
