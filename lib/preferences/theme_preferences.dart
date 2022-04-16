import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  static const key = 'theme_key';

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(key)) {
      return sharedPreferences.getBool(key);
    } else {
      return false;
    }
  }
}
