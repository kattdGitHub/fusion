import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<bool> setUserLogin(bool value) async {
    final SharedPreferences prefs = await _prefs;
    return await prefs.setBool('UserLogin', value);
  }

  Future<bool> getUserLogin() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool('UserLogin') ?? false;
  }
}
