import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../providers/theme_provider.dart';
import 'package:lottie/lottie.dart';

import '../providers/patient_provider.dart';
import '../providers/doctor_provider.dart';
import '../providers/medical_provider.dart';

import '../models/appointment.dart';

import '../preferences/patient_preferences.dart';

import '../routes/routing_constants.dart';

import '../configs/global.dart';

import '../widgets/present_illness_image_widget.dart';
import '../widgets/summary_screen_one.dart';
import '../widgets/summary_screen_two.dart';
import '../widgets/summary_screen_three.dart';
import '../widgets/summary_screen_four.dart';
import '../widgets/summary_screen_five.dart';
import '../widgets/appointment_summary.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({
    Key? key,
    required this.appointmentData,
    required this.status,
  }) : super(key: key);
  final Appointment appointmentData;
  final String status;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final _pageController = PageController();
  final _patientPreferences = PatientPreferences();
  Future<bool> result = Future.value(false);

  String _patientId = '';
  Map<String, dynamic> _patientDetails = {};
  Map<String, dynamic> _doctorDetails = {};
  Map<String, dynamic> _chiefComplaintDetails = {};
  Map<String, dynamic> _presentIllnessDetails = {};
  Map<String, dynamic> _presentIllnessImageDetails = {};
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

  Future<bool> loadMedicalData() async {
    _patientId = await _patientPreferences.getPatient();
    String patientDetails =
        await Provider.of<PatientProvider>(context, listen: false)
            .fetchPatient(_patientId);
    _patientDetails = jsonDecode(patientDetails);
    if (widget.status != 'for_appointment') {
      _doctorDetails = await Provider.of<DoctorProvider>(context, listen: false)
          .getDoctor(widget.appointmentData.doctor);
    }
    _chiefComplaintDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getChiefComplaint(widget.appointmentData.unicode);
    _presentIllnessImageDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getPresentIllnessImage(widget.appointmentData.unicode);
    _presentIllnessDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getPresentIllness(widget.appointmentData.unicode);
    _childhoodIllnessDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getChildhooIllness(widget.appointmentData.unicode);
    _adultIllnessDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getAdultIllness(widget.appointmentData.unicode);
    _historyOfImmunizationDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getHistoryOfImmunization(widget.appointmentData.unicode);
    _familyHistoryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getFamilyHistory(widget.appointmentData.unicode);
    _personalAndSocialHistoryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getPersonalAndSocialHistory(widget.appointmentData.unicode);
    _functionalHistoryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getFunctionalHistory(widget.appointmentData.unicode);
    _familyHistoryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getFamilyHistory(widget.appointmentData.unicode);
    _personalAndSocialHistoryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getPersonalAndSocialHistory(widget.appointmentData.unicode);
    _functionalHistoryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getFunctionalHistory(widget.appointmentData.unicode);
    _generalSystemDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getGeneralSystem(widget.appointmentData.unicode);
    _skinProblemDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getSkinProblem(widget.appointmentData.unicode);
    _heentDetails = await Provider.of<MedicalProvider>(context, listen: false)
        .getHeent(widget.appointmentData.unicode);
    _breastsDetails = await Provider.of<MedicalProvider>(context, listen: false)
        .getBreast(widget.appointmentData.unicode);
    _pulmonaryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getPulmonary(widget.appointmentData.unicode);
    _cardiovascularDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getCardiovascular(widget.appointmentData.unicode);
    _gastronintestinalDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getGastrointestinal(widget.appointmentData.unicode);
    _genitourinaryDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getGenitourinary(widget.appointmentData.unicode);
    _gynecologicDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getGynecologic(widget.appointmentData.unicode);
    _endocrineDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getEndocrine(widget.appointmentData.unicode);
    _neurologiDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getNeurologic(widget.appointmentData.unicode);
    _musculoskeletalDetails =
        await Provider.of<MedicalProvider>(context, listen: false)
            .getMusculoskeletal(widget.appointmentData.unicode);
    return true;
  }

  @override
  void initState() {
    print('STATUS: ' + widget.status);
    result = loadMedicalData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: result,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Medical Document'),
                // actions: <Widget>[
                //   IconButton(
                //     onPressed: () {
                //       Navigator.pushNamed(context, preferencesScreenRoute);
                //     },
                //     icon: const Icon(Icons.send),
                //   ),
                // ],
              ),
              body: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        Provider.of<ThemeProvider>(context).childBackground,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 150,
                        child: PageView(
                          controller: _pageController,
                          children: [
                            presentIllnessImageWidget(
                                context,
                                Global.baseIpAddress +
                                    _presentIllnessImageDetails[
                                        'illness_image']),
                            summaryScreenOne(context, _patientDetails,
                                _chiefComplaintDetails, _presentIllnessDetails),
                            summaryScreenTwo(
                                context,
                                _childhoodIllnessDetails,
                                _adultIllnessDetails,
                                _historyOfImmunizationDetails),
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
                                false,
                                widget.status),
                            if (widget.status != 'for_appointment') ...[
                              appointmentSummary(
                                context,
                                widget.appointmentData,
                                widget.status,
                                'Dr. ' +
                                    _doctorDetails['first_name'] +
                                    ' ' +
                                    _doctorDetails['middle_name'] +
                                    ' ' +
                                    _doctorDetails['last_name'],
                                _doctorDetails['specialization']['field'],
                              )
                            ]
                          ],
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.status != 'for_appointment' ? 7 : 6,
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
                ),
              ),
            );
          }
        }
        return Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 130,
                    child:
                        Image.asset('assets/images/logos/rapha_logo_full.png'),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: 100,
                    child: Lottie.asset(
                        'assets/json/lottie/loading_submission.json'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Medical Document'),
    //     actions: <Widget>[
    //       IconButton(
    //         onPressed: () {
    //           Navigator.pushNamed(context, preferencesScreenRoute);
    //         },
    //         icon: const Icon(Icons.send),
    //       ),
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     physics: const NeverScrollableScrollPhysics(),
    //     child: Container(
    //       height: MediaQuery.of(context).size.height,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           image: AssetImage(
    //             Provider.of<ThemeProvider>(context).childBackground,
    //           ),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       child: null,
    //     ),
    //   ),
    // );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Summary Results'),
    //   ),
    // body: Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     SizedBox(
    //       height: MediaQuery.of(context).size.height - 150,
    //       child: PageView(
    //         controller: _pageController,
    //         children: [
    //           presentIllnessImageWidget(
    //               context, _presentIllnessImageDetails['illness_image']),
    //           summaryScreenOne(context, _patientDetails,
    //               _chiefComplaintDetails, _presentIllnessDetails),
    //           summaryScreenTwo(context, _childhoodIllnessDetails,
    //               _adultIllnessDetails, _historyOfImmunizationDetails),
    //           summaryScreenThree(
    //               context,
    //               _familyHistoryDetails,
    //               _personalAndSocialHistoryDetails,
    //               _functionalHistoryDetails),
    //           summaryScreenFour(
    //               context,
    //               _generalSystemDetails,
    //               _skinProblemDetails,
    //               _heentDetails,
    //               _breastsDetails,
    //               _pulmonaryDetails),
    //           summaryScreenFive(
    //               context,
    //               _cardiovascularDetails,
    //               _gastronintestinalDetails,
    //               _genitourinaryDetails,
    //               _gynecologicDetails,
    //               _endocrineDetails,
    //               _musculoskeletalDetails,
    //               _neurologiDetails),
    //         ],
    //       ),
    //     ),
    //     SmoothPageIndicator(
    //       controller: _pageController,
    //       count: 6,
    //       effect: SwapEffect(
    //         type: SwapType.zRotation,
    //         activeDotColor: Colors.blue.shade800,
    //         dotColor: Colors.lightBlue,
    //         dotHeight: 10,
    //         dotWidth: 10,
    //         spacing: 16,
    //       ),
    //     ),
    //   ],
    // ),
    // );
  }
}
