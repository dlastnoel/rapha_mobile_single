import 'package:shared_preferences/shared_preferences.dart';

class PatientPreferences {
  static const patientKey = 'patient_key';
  static const patientDetailsKey = 'patient_details_key';
  static bool patientData = false;

  setPatient(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(patientKey, id);
    patientData = false;
  }

  getPatient() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString(patientKey));
    return sharedPreferences.getString(patientKey);
  }

  setPatientDetails(String patientDetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(patientDetailsKey, patientDetails);
    patientData = true;
    sharedPreferences.remove(patientKey);
  }

  getPatientDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(patientDetailsKey);
  }

  hasPatientData() => patientData;
}
