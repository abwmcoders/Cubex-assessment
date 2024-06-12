import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<String?> getString(key) async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    String? res = prefs.getString("$key");
    return res;
  }

  /// Adding a string value
  dynamic getJson(key) async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    String jsonString = prefs.getString("$key")!;
    var res = jsonDecode(jsonString);
    return res;
  }

  /// Adding a string value
  Future<bool> putString(key, val) async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    var res = prefs.setString("$key", val);
    return res;
  }

  /// Adding a bool value
  dynamic putBool(key, val) async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    var res = prefs.setBool("$key", val);
    return res;
  }

  /// Adding a bool value
  dynamic getBool(key) async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    var res = prefs.getBool("$key");
    return res;
  }

  /// Adding a list or object
  /// Use import 'dart:convert'; for jsonEncode
  dynamic putJson(key, val) async {
    Future<SharedPreferences> prefs0 = SharedPreferences.getInstance();
    final SharedPreferences prefs = await prefs0;
    var valString = jsonEncode(val);
    var res = prefs.setString("$key", valString);
    return res;
  }
}
