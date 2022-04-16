import 'package:shared_preferences/shared_preferences.dart';

class DoctorPreferences {
  static const key = 'doctor_key';

  setDoctor(String doctor) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, doctor);
  }

  getDoctor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey(key)) {
      return sharedPreferences.getString(key);
    }
    return null;
  }
}
