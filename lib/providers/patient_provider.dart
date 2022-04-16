import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../api/api_endpoints.dart';

import '../models/patient.dart';
import '../preferences/client_preferences.dart';
import '../preferences/patient_preferences.dart';

class PatientProvider with ChangeNotifier {
  final _clientPreferences = ClientPreferences();
  final _patientPreferences = PatientPreferences();

  Future<bool> hasPatients() async {
    Map<String, String> body = {
      'client': await _clientPreferences.getClient(),
      'code': await _clientPreferences.getCode(),
    };
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(ApiEndpoints.getPatientsUrl),
        headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<String> addPatient() async {
    String patient = await _patientPreferences.getPatientDetails();
    Map<String, dynamic> body = jsonDecode(patient);
    body['client'] = await _clientPreferences.getClient();
    body['code'] = await _clientPreferences.getCode();
    final response =
        await http.post(Uri.parse(ApiEndpoints.addPatientUrl), body: body);
    Map<String, dynamic> apiResponse = json.decode(response.body);
    return apiResponse['id'];
  }

  Future<List<Patient>> fetchPatients() async {
    List<Patient> patients = [];
    Map<String, String> body = {
      'client': await _clientPreferences.getClient(),
      'code': await _clientPreferences.getCode(),
    };
    final response =
        await http.post(Uri.parse(ApiEndpoints.getPatientsUrl), body: body);
    var data = json.decode(response.body);

    for (var patient in data) {
      patients.add(Patient.fromJson(patient));
    }

    return patients;
  }

  Future<String> fetchPatient(String id) async {
    Map<String, String> body = {
      'id': await _patientPreferences.getPatient(),
    };
    final response =
        await http.post(Uri.parse(ApiEndpoints.getPatientUrl), body: body);
    Map<String, dynamic> result = json.decode(response.body);
    // print(result);
    return jsonEncode(result);
  }
}
