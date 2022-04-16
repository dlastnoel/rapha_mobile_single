import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MedicalPreferences with ChangeNotifier {
  static const chiefComplaintKey = 'chief_complaint_key';
  static const presentIllnessKey = 'present_illness_key';
  static const presentIllnessImageKey = 'present_illness_image_key';
  static const childhooIllnessKey = 'childhood-illness-key';
  static const adultIllnessKey = 'adult-illness-key';
  static const historyOfImmunizationKey = 'history-of-immunization-key';
  static const familiHistoryKey = 'family-history-key';
  static const personalAndSocialHistoryKey = 'personal-and-social-history-key';
  static const functionalHistoryKey = 'functional-history-key';
  static const generalSystemKey = 'general-system-key';
  static const skinProblemKey = 'skin-problem-key';
  static const heentKey = 'heent-key';
  static const breastsKey = 'breasts-key';
  static const pulmonaryKey = 'pulmonary-key';
  static const cardiovasularKey = 'cardiovascular-key';
  static const gastroIntestinalKey = 'gastroinstestinal-key';
  static const genitourinaryKey = 'genitourinanry-key';
  static const gynecologicKey = 'gynecologic-key';
  static const endocrineKey = 'endocrine-key';
  static const musculoSkeletalKey = 'musculoskeletal-key';
  static const neurologiKey = 'neurologic-key';

  setChiefComplaint(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(chiefComplaintKey, data);
    print(sharedPreferences.getString(chiefComplaintKey));
  }

  getChiefComplaint() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(chiefComplaintKey);
  }

  setPresentIllessImage(Uint8List bytes) async {
    String imageBytes = String.fromCharCodes(bytes);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(presentIllnessImageKey, imageBytes);
    print(sharedPreferences.getString(presentIllnessImageKey));
  }

  getPresentIllnessImage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(presentIllnessImageKey);
  }

  setPresentIllness(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(presentIllnessKey, data);
    print(sharedPreferences.getString(presentIllnessKey));
  }

  getPresentIllness() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(presentIllnessKey);
  }

  setChildHoodIllness(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(childhooIllnessKey, data);
    print(sharedPreferences.getString(childhooIllnessKey));
  }

  getChildHoodIllness() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(childhooIllnessKey);
  }

  setAdultIllness(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(adultIllnessKey, data);
    print(sharedPreferences.getString(adultIllnessKey));
  }

  getAdultIllness() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(adultIllnessKey);
  }

  setHistoryOfImmunization(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(historyOfImmunizationKey, data);
    print(sharedPreferences.getString(historyOfImmunizationKey));
  }

  getHistoryOfImmunization() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(historyOfImmunizationKey);
  }

  setFamilyHistory(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(familiHistoryKey, data);
    print(sharedPreferences.getString(familiHistoryKey));
  }

  getFamilyHistory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(familiHistoryKey);
  }

  setPersonalAndSocialHistory(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(personalAndSocialHistoryKey, data);
    print(sharedPreferences.getString(personalAndSocialHistoryKey));
  }

  getPersonalAndSocialHistory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(personalAndSocialHistoryKey);
  }

  setFunctionalHistory(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(functionalHistoryKey, data);
    print(sharedPreferences.getString(functionalHistoryKey));
  }

  getFunctionalHistory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(functionalHistoryKey);
  }

  setGeneralSystem(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(generalSystemKey, data);
    print(sharedPreferences.getString(generalSystemKey));
  }

  getGeneralSystem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(generalSystemKey);
  }

  setSkinProblem(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(skinProblemKey, data);
    print(sharedPreferences.getString(skinProblemKey));
  }

  getSkinProblem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(skinProblemKey);
  }

  setHeent(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(heentKey, data);
    print(sharedPreferences.getString(heentKey));
  }

  getHeent() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(heentKey);
  }

  setBreasts(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(breastsKey, data);
    print(sharedPreferences.getString(breastsKey));
  }

  getBreasts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(breastsKey);
  }

  setPulmonary(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(pulmonaryKey, data);
    print(sharedPreferences.getString(pulmonaryKey));
  }

  getPulmonary() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(pulmonaryKey);
  }

  setCardiovascular(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(cardiovasularKey, data);
    print(sharedPreferences.getString(cardiovasularKey));
  }

  getCardiovascular() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(cardiovasularKey);
  }

  setGastrointestinal(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(gastroIntestinalKey, data);
    print(sharedPreferences.getString(gastroIntestinalKey));
  }

  getGastrointestinal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(gastroIntestinalKey);
  }

  setGenitourinary(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(genitourinaryKey, data);
    print(sharedPreferences.getString(genitourinaryKey));
  }

  getGenitourinary() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(genitourinaryKey);
  }

  setGynecologic(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(gynecologicKey, data);
    print(sharedPreferences.getString(gynecologicKey));
  }

  getGynecologic() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(gynecologicKey);
  }

  setEndocrine(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(endocrineKey, data);
    print(sharedPreferences.getString(endocrineKey));
  }

  getEndocrine() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(endocrineKey);
  }

  setNeurologic(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(neurologiKey, data);
    print(sharedPreferences.getString(neurologiKey));
  }

  setMusculoskeletal(String data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(musculoSkeletalKey, data);
    print(sharedPreferences.getString(musculoSkeletalKey));
  }

  getMusculoskeletal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(musculoSkeletalKey);
  }

  getNeurologic() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(neurologiKey);
  }
}
