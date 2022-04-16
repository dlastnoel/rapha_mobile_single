import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/doctor.dart';
import '../models/appointment.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/appointment_preferences.dart';

import '../api/api_endpoints.dart';

import '../helpers/headers.dart';

class AppointmentProvider with ChangeNotifier {
  final _patientPreferences = PatientPreferences();
  final _appointmentPreferences = AppointmentPrefereces();

  Future<String> isSlotOpen() async {
    final response = await http.get(Uri.parse(ApiEndpoints.getSlotUrl));
    var data = json.decode(response.body);
    return Future.value(data['limit']);
  }

  Future<bool> createAppointment(String patient, String unicode) async {
    Map<String, dynamic> body = {
      'patient': patient,
      'unicode': unicode,
    };
    final response = await http.post(
        Uri.parse(ApiEndpoints.createAppointmentUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> apiResponse = json.decode(response.body);
    String appointmentId = apiResponse['id'];
    _appointmentPreferences.setUnicode(unicode);
    _appointmentPreferences.setAppointmentData(appointmentId);
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<List<Appointment>> getAppointments(doctor, checkupDate) async {
    List<Appointment> appointments = [];
    Map<String, dynamic> body = {
      'doctor': doctor,
      'checkup_date': checkupDate,
    };
    final response = await http.post(Uri.parse(ApiEndpoints.getAppointmentsUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    var data = json.decode(response.body);
    print('RESULT: ' + response.statusCode.toString());
    print(json.decode(response.body));
    try {
      for (var appointment in data) {
        appointments.add(Appointment.fromJson(appointment));
      }
    } catch (ex) {}
    return appointments;
  }

  Future<bool> addPatientData(
      doctor, checkupDate, checkupStart, checkupEnd) async {
    final String id = await _appointmentPreferences.getAppointmentData();
    final String unicode = await _appointmentPreferences.getUnicode();
    final String patient = await _patientPreferences.getPatient();
    Map<String, dynamic> body = {
      'id': id,
      'unicode': unicode,
      'checkup_date': checkupDate,
      'checkup_start': checkupStart,
      'checkup_end': checkupEnd,
      'patient': patient,
      'doctor': doctor
    };
    final response = await http.post(Uri.parse(ApiEndpoints.addPatientData),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> cancelPatientData() async {
    final String id = await _appointmentPreferences.getAppointmentData();
    final String unicode = await _appointmentPreferences.getUnicode();
    final String patient = await _patientPreferences.getPatient();
    Map<String, dynamic> body = {
      'id': id,
      'unicode': unicode,
      'patient': patient,
    };
    final response = await http.post(Uri.parse(ApiEndpoints.cancelPatientData),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> deleteMedicalData(String unicode) async {
    Map<String, dynamic> body = {
      'unicode': unicode,
    };
    final response = await http.post(Uri.parse(ApiEndpoints.deleteMedicalData),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
