import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const _isLoggedIn = "isUserLoggedIn";

  static Future<void> setUserLoggedIn(bool value) async {
    final instance = await SharedPreferences.getInstance();

    instance.setBool(_isLoggedIn, value);
  }

  static Future<bool> getIsUserLoggedIn() async {
    final instance = await SharedPreferences.getInstance();

    bool res = instance.getBool(_isLoggedIn) ?? false;
    return res;
  }
}
