import 'package:shared_preferences/shared_preferences.dart';

class AppointmentPrefereces {
  static const appointmentKey = 'appointment_key';
  static const appointmentUnicodeKey = 'appointment_unicode_key';

  setAppointmentData(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(appointmentKey, id);
  }

  getAppointmentData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString(appointmentKey));
    return sharedPreferences.getString(appointmentKey);
  }

  removeAppointmentData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(appointmentKey);
  }

  setUnicode(String unicode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(appointmentUnicodeKey, unicode);
  }

  getUnicode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString(appointmentUnicodeKey));
    return sharedPreferences.getString(appointmentUnicodeKey);
  }
}
