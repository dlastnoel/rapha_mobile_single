import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/summary_screen_one.dart';
import '../widgets/summary_screen_two.dart';
import '../widgets/summary_screen_three.dart';
import '../widgets/summary_screen_four.dart';
import '../widgets/summary_screen_five.dart';

import '../providers/patient_provider.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final _pageController = PageController();
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();
  String _patientId = '';
  Map<String, dynamic> _patientDetails = {};
  Map<String, dynamic> _chiefComplaintDetails = {};
  Map<String, dynamic> _presentIllnessDetails = {};
  Map<String, dynamic> _childhoodIllnessDetails = {};
  Map<String, dynamic> _adultIllnessDetails = {};
  Map<String, dynamic> _historyOfImmunizationDetails = {};
  Map<String, dynamic> _familyHistoryDetails = {};
  Map<String, dynamic> _personalAndSocialHistoryDetails = {};
  Map<String, dynamic> _functionalHistoryDetails = {};
  Map<String, dynamic> _generalSystemDetails = {};
  Map<String, dynamic> _skinProblemDetails = {};
  Map<String, dynamic> _heentDetails = {};
  Map<String, dynamic> _breastsDetails = {};
  Map<String, dynamic> _pulmonaryDetails = {};
  Map<String, dynamic> _cardiovascularDetails = {};
  Map<String, dynamic> _gastronintestinalDetails = {};
  Map<String, dynamic> _genitourinaryDetails = {};
  Map<String, dynamic> _gynecologicDetails = {};
  Map<String, dynamic> _endocrineDetails = {};
  Map<String, dynamic> _neurologiDetails = {};
  Map<String, dynamic> _musculoskeletalDetails = {};
  void loadData() async {
    String patientDetails = '';
    _patientDetails['date_of_birth'] = '';
    _patientDetails['sex'] = '';
    _patientDetails['marital_status'] = '';
    if (_patientPreferences.hasPatientData()) {
      patientDetails = await _patientPreferences.getPatientDetails();
    } else {
      _patientId = await _patientPreferences.getPatient();
      patientDetails =
          await Provider.of<PatientProvider>(context, listen: false)
              .fetchPatient(_patientId);
    }
    await _medicalPreferences.getPresentIllnessImage();
    String chiefComplaintDetails =
        await _medicalPreferences.getChiefComplaint();
    String presentIllnessDetails =
        await _medicalPreferences.getPresentIllness();
    String childhoodIllnessDetails =
        await _medicalPreferences.getChildHoodIllness();
    String adultIllnessDetails = await _medicalPreferences.getAdultIllness();
    String historyOfImmunizationDetails =
        await _medicalPreferences.getHistoryOfImmunization();
    String familyHistoryDetails = await _medicalPreferences.getFamilyHistory();
    String personalAndSocialHistoryDetails =
        await _medicalPreferences.getPersonalAndSocialHistory();
    String functionalHistoryDetails =
        await _medicalPreferences.getFunctionalHistory();
    String generalSystem = await _medicalPreferences.getGeneralSystem();
    String skinProblemDetails = await _medicalPreferences.getSkinProblem();
    String heentDetails = await _medicalPreferences.getHeent();
    String breastDetails = await _medicalPreferences.getBreasts();
    String pulmonaryDetails = await _medicalPreferences.getPulmonary();
    String cardiovascularDetails =
        await _medicalPreferences.getCardiovascular();
    String gastrointestinalDetails =
        await _medicalPreferences.getGastrointestinal();
    String genitourinaryDetails = await _medicalPreferences.getGenitourinary();
    String gynecologicDetails = await _medicalPreferences.getGynecologic();
    String endocrineDetails = await _medicalPreferences.getEndocrine();
    String musculoskeletalDetails =
        await _medicalPreferences.getMusculoskeletal();
    String neurologiDetails = await _medicalPreferences.getNeurologic();

    _patientDetails = jsonDecode(patientDetails);
    _chiefComplaintDetails = jsonDecode(chiefComplaintDetails);
    _presentIllnessDetails = jsonDecode(presentIllnessDetails);
    _childhoodIllnessDetails = jsonDecode(childhoodIllnessDetails);
    _adultIllnessDetails = jsonDecode(adultIllnessDetails);
    _historyOfImmunizationDetails = jsonDecode(historyOfImmunizationDetails);
    _personalAndSocialHistoryDetails =
        jsonDecode(personalAndSocialHistoryDetails);
    _familyHistoryDetails = jsonDecode(familyHistoryDetails);
    _functionalHistoryDetails = jsonDecode(functionalHistoryDetails);
    _generalSystemDetails = jsonDecode(generalSystem);
    _skinProblemDetails = jsonDecode(skinProblemDetails);
    _heentDetails = jsonDecode(heentDetails);
    _breastsDetails = jsonDecode(breastDetails);
    _pulmonaryDetails = jsonDecode(pulmonaryDetails);
    _cardiovascularDetails = jsonDecode(cardiovascularDetails);
    _gastronintestinalDetails = jsonDecode(gastrointestinalDetails);
    _genitourinaryDetails = jsonDecode(genitourinaryDetails);
    _gynecologicDetails = jsonDecode(gynecologicDetails);
    _endocrineDetails = jsonDecode(endocrineDetails);
    _musculoskeletalDetails = jsonDecode(musculoskeletalDetails);
    _neurologiDetails = jsonDecode(neurologiDetails);
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 150,
            child: PageView(
              controller: _pageController,
              children: [
                summaryScreenOne(context, _patientDetails,
                    _chiefComplaintDetails, _presentIllnessDetails),
                summaryScreenTwo(context, _childhoodIllnessDetails,
                    _adultIllnessDetails, _historyOfImmunizationDetails),
                summaryScreenThree(
                    context,
                    _familyHistoryDetails,
                    _personalAndSocialHistoryDetails,
                    _functionalHistoryDetails),
                summaryScreenFour(
                    context,
                    _generalSystemDetails,
                    _skinProblemDetails,
                    _heentDetails,
                    _breastsDetails,
                    _pulmonaryDetails),
                summaryScreenFive(
                    context,
                    _cardiovascularDetails,
                    _gastronintestinalDetails,
                    _genitourinaryDetails,
                    _gynecologicDetails,
                    _endocrineDetails,
                    _musculoskeletalDetails,
                    _neurologiDetails,
                    true,
                    'for_appointment'),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 5,
            effect: SwapEffect(
              type: SwapType.zRotation,
              activeDotColor: Colors.blue.shade800,
              dotColor: Colors.lightBlue,
              dotHeight: 10,
              dotWidth: 10,
              spacing: 16,
            ),
          ),
        ],
      ),
    );
  }
}
