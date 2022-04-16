import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../preferences/client_preferences.dart';
import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

import '../api/api_endpoints.dart';
import '../helpers/screenshots_naming.dart';
import '../helpers/headers.dart';

import '../models/appointment.dart';

class MedicalProvider with ChangeNotifier {
  final _clientPreferences = ClientPreferences();
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();

  Future<bool> addChiefComplaint(String patient, String unicode) async {
    String chiefComplaintDetails =
        await _medicalPreferences.getChiefComplaint();
    Map<String, dynamic> body = jsonDecode(chiefComplaintDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addChiefComplaintUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addPresentIllnessImage(String patient, String unicode) async {
    String bytes = await _medicalPreferences.getPresentIllnessImage();
    Uint8List imageBytes = Uint8List.fromList(bytes.codeUnits);
    final image = http.MultipartFile.fromBytes('illness_image', imageBytes,
        filename: screenShotName);
    final request = http.MultipartRequest(
        'POST', Uri.parse(ApiEndpoints.addPresentIllnessImage));
    request.fields['patient'] = patient;
    request.fields['unicode'] = unicode;
    request.files.add(image);
    final response = await request.send();
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addPresentIllness(String patient, String unicode) async {
    String presentIllnessDetails =
        await _medicalPreferences.getPresentIllness();
    Map<String, dynamic> body = jsonDecode(presentIllnessDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addPresentIllnessUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addChildhoodIllness(String patient, String unicode) async {
    String childhoodIllnessDetails =
        await _medicalPreferences.getChildHoodIllness();
    Map<String, dynamic> body = jsonDecode(childhoodIllnessDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addChildhoodIllnessUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addAdultIllness(String patient, String unicode) async {
    String adultIllnessDetails = await _medicalPreferences.getAdultIllness();
    Map<String, dynamic> body = jsonDecode(adultIllnessDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addAdultIllnessUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addHistoryOfImmunization(String patient, String unicode) async {
    String historyOfImmunizationDetails =
        await _medicalPreferences.getHistoryOfImmunization();
    Map<String, dynamic> body = jsonDecode(historyOfImmunizationDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addHistoryOfImmunizationUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addFamilyHistory(String patient, String unicode) async {
    String familyHistoryDetails = await _medicalPreferences.getFamilyHistory();
    Map<String, dynamic> body = jsonDecode(familyHistoryDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addFamilyHistoryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addPersonalAndSocialHistory(
      String patient, String unicode) async {
    String personalAndSocialHistory =
        await _medicalPreferences.getPersonalAndSocialHistory();
    Map<String, dynamic> body = jsonDecode(personalAndSocialHistory);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addPersonalAndSocialHistoryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  // Medical Api Providers
  // Adding
  Future<bool> addFunctionalHistory(String patient, String unicode) async {
    String functionalHistoryDetails =
        await _medicalPreferences.getFunctionalHistory();
    Map<String, dynamic> body = jsonDecode(functionalHistoryDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addFunctionalHistoryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addGeneralSystem(String patient, String unicode) async {
    String generalSystemDetails = await _medicalPreferences.getGeneralSystem();
    Map<String, dynamic> body = jsonDecode(generalSystemDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addGeneralSystemUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addSkinProblem(String patient, String unicode) async {
    String skinProblemDetails = await _medicalPreferences.getSkinProblem();
    Map<String, dynamic> body = jsonDecode(skinProblemDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addSkinProblemUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addHeent(String patient, String unicode) async {
    String heentDetails = await _medicalPreferences.getHeent();
    Map<String, dynamic> body = jsonDecode(heentDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addHeentUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addBreast(String patient, String unicode) async {
    String breastDetails = await _medicalPreferences.getBreasts();
    Map<String, dynamic> body = jsonDecode(breastDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addBreastUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addPulmonary(String patient, String unicode) async {
    String pulmonaryDetails = await _medicalPreferences.getPulmonary();
    Map<String, dynamic> body = jsonDecode(pulmonaryDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addPulmonaryUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addCardiovascular(String patient, String unicode) async {
    String cardiovascularDetails =
        await _medicalPreferences.getCardiovascular();
    Map<String, dynamic> body = jsonDecode(cardiovascularDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addCardiovascularUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addGastroIntestinal(String patient, String unicode) async {
    String gastrointestinalDetails =
        await _medicalPreferences.getGastrointestinal();
    Map<String, dynamic> body = jsonDecode(gastrointestinalDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addGastrointestinalUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addGastrointestinal(String patient, String unicode) async {
    String gastrointestinalDetails =
        await _medicalPreferences.getGastrointestinal();
    Map<String, dynamic> body = jsonDecode(gastrointestinalDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addGastrointestinalUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addGenitourinary(String patient, String unicode) async {
    String genitourinaryDetails = await _medicalPreferences.getGenitourinary();
    Map<String, dynamic> body = jsonDecode(genitourinaryDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addGenitourinaryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addGynecologic(String patient, String unicode) async {
    String gynecologicDetails = await _medicalPreferences.getGynecologic();
    Map<String, dynamic> body = jsonDecode(gynecologicDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addGynecologicUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addEndocrine(String patient, String unicode) async {
    String endocrineDetails = await _medicalPreferences.getEndocrine();
    Map<String, dynamic> body = jsonDecode(endocrineDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addEndocrineUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addMusculoskeletal(String patient, String unicode) async {
    String musculoskeletalDetails =
        await _medicalPreferences.getMusculoskeletal();
    Map<String, dynamic> body = jsonDecode(musculoskeletalDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(
        Uri.parse(ApiEndpoints.addMusculoskeletalUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  Future<bool> addNeurologic(String patient, String unicode) async {
    String neurologicDetails = await _medicalPreferences.getNeurologic();
    Map<String, dynamic> body = jsonDecode(neurologicDetails);
    body['patient'] = patient;
    body['unicode'] = unicode;
    final response = await http.post(Uri.parse(ApiEndpoints.addNeurologicUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  // Future<bool> addPatientData(String patient, String unicode) async {
  //   String neurologicDetails = await _medicalPreferences.getNeurologic();
  //   Map<String, dynamic> body = jsonDecode(neurologicDetails);
  //   body['patient'] = patient;
  //   body['unicode'] = unicode;
  //   final response = await http.post(Uri.parse(ApiEndpoints.addNeurologicUrl),
  //       headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
  //   print('RESULT: ' + response.statusCode.toString());
  //   if (response.statusCode == 200) {
  //     return Future.value(true);
  //   }
  //   return Future.value(false);
  // }

  Future<List<Appointment>> getPatientData(String status) async {
    List<Appointment> patientData = [];
    Map<String, dynamic> body = {
      'patient': await _patientPreferences.getPatient(),
      'status': status
    };
    final response = await http.post(Uri.parse(ApiEndpoints.getPatientData),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    print('RESULT: ' + response.statusCode.toString());
    var data = json.decode(response.body);

    for (var patient in data) {
      patientData.add(Appointment.fromJson(patient));
    }
    print(response.statusCode);
    return patientData;
  }

  Future<Map<String, dynamic>> getChiefComplaint(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getChiefComplaintUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getPresentIllnessImage(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getPresentIllnessImageUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getPresentIllness(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getPresentIllnessUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getChildhooIllness(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getChildhoodIllnessUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = json.decode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getAdultIllness(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getAdultIllnessUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getHistoryOfImmunization(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getHistoryOfImmunizationUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getFamilyHistory(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getFamilyHistoryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getPersonalAndSocialHistory(
      String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getPersonalAndSocialHistoryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getFunctionalHistory(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getFunctionalHistoryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getGeneralSystem(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getGeneralSystemUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getSkinProblem(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getSkinProblemUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getHeent(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getHeentUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getBreast(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getBreastUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getPulmonary(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getPulmonaryUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getCardiovascular(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getCardiovascularUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getGastrointestinal(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getGastrointestinalUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getGenitourinary(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getGenitourinaryUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getGynecologic(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getGynecologicUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getEndocrine(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getEndocrineUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getMusculoskeletal(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(
        Uri.parse(ApiEndpoints.getMusculoskeletalUrl),
        headers: Headers.getContentTypeHeaders(),
        body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  Future<Map<String, dynamic>> getNeurologic(String unicode) async {
    Map<String, dynamic> body = {'unicode': unicode};
    final response = await http.post(Uri.parse(ApiEndpoints.getNeurologicUrl),
        headers: Headers.getContentTypeHeaders(), body: jsonEncode(body));
    Map<String, dynamic> result = jsonDecode(response.body);
    print(result);
    return Future.value(result);
  }

  // Future<bool> addChiefComplaint(String patient, String unicode) async {
  //   String chiefComplaintDetails =
  //       await _medicalPreferences.getChiefComplaint();
  //   Map<String, dynamic> body = jsonDecode(chiefComplaintDetails);
  //   body['patient'] = patient;
  //   body['unicode'] = unicode;
  //   final response = await http.post(
  //       Uri.parse(ApiEndpoints.addChiefComplaintUrl),
  //       headers: Headers.getContentTypeHeaders(),
  //       body: jsonEncode(body));
  //   print('RESULT: ' + response.statusCode.toString());
  //   if (response.statusCode == 200) {
  //     return Future.value(true);
  //   }
  //   return Future.value(false);
}
