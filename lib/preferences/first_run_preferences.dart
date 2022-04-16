import 'package:shared_preferences/shared_preferences.dart';

class FirstRunPreferences {
  static const key = 'first_run_key';

  disableFirstRun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, false);
  }

  Future<bool> getFirstRun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(key)) {
      if (sharedPreferences.getBool(key) == true) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } else {
      return Future.value(true);
    }
  }
}
