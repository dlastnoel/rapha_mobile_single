import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../preferences/doctor_preferences.dart';

import '../api/api_endpoints.dart';
import '../models/doctor.dart';
import '../models/schedule.dart';

class DoctorProvider with ChangeNotifier {
  final _doctorPreferences = DoctorPreferences();

  Future<List<Doctor>> fetchDoctors() async {
    List<Doctor> doctors = [];
    final response = await http.get(Uri.parse(ApiEndpoints.getDoctorsUrl));
    var data = json.decode(response.body);

    for (var doctor in data) {
      doctors.add(Doctor.fromJson(doctor));
    }
    return doctors;
  }

  Future<Map<String, dynamic>> getDoctor(id) async {
    Map<String, String> body = {
      'id': id,
    };
    final response =
        await http.post(Uri.parse(ApiEndpoints.getDoctorUrl), body: body);
    // var data = json.decode(response.body);
    // Doctor doctor = Doctor.fromJson(data);
    Map<String, dynamic> doctor = json.decode(response.body);

    return doctor;
  }

  Future<List<Schedule>> fetchSchedules(String id) async {
    List<Schedule> schedules = [];
    Map<String, String> body = {'id': id};
    final response =
        await http.post(Uri.parse(ApiEndpoints.getScheduleUrl), body: body);
    var data = json.decode(response.body);

    for (var schedule in data) {
      schedules.add(Schedule.fromJson(schedule));
    }
    return schedules;
  }
}
