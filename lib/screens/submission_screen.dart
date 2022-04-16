import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

import '../preferences/patient_preferences.dart';

import '../providers/theme_provider.dart';
import '../providers/patient_provider.dart';
import '../providers/medical_provider.dart';
import '../providers/appointment_provider.dart';

import '../widgets/dialogs.dart';

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({Key? key}) : super(key: key);

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  final _patientPreferences = PatientPreferences();
  final _uuid = const Uuid();
  Future<bool> sendMedicalData() async {
    bool patientData = await _patientPreferences.hasPatientData();
    String patient = '';
    String unicode = _uuid.v4();
    if (patientData) {
      patient = await Provider.of<PatientProvider>(context, listen: false)
          .addPatient();
    } else {
      patient = await _patientPreferences.getPatient();
    }
    bool r1 = await Provider.of<MedicalProvider>(context, listen: false)
        .addChiefComplaint(patient, unicode);
    bool r2 = await Provider.of<MedicalProvider>(context, listen: false)
        .addPresentIllnessImage(patient, unicode);
    bool r3 = await Provider.of<MedicalProvider>(context, listen: false)
        .addPresentIllness(patient, unicode);
    bool r4 = await Provider.of<MedicalProvider>(context, listen: false)
        .addChildhoodIllness(patient, unicode);
    bool r5 = await Provider.of<MedicalProvider>(context, listen: false)
        .addAdultIllness(patient, unicode);
    bool r6 = await Provider.of<MedicalProvider>(context, listen: false)
        .addHistoryOfImmunization(patient, unicode);
    bool r7 = await Provider.of<MedicalProvider>(context, listen: false)
        .addFamilyHistory(patient, unicode);
    bool r8 = await Provider.of<MedicalProvider>(context, listen: false)
        .addPersonalAndSocialHistory(patient, unicode);
    bool r9 = await Provider.of<MedicalProvider>(context, listen: false)
        .addFunctionalHistory(patient, unicode);
    bool r10 = await Provider.of<MedicalProvider>(context, listen: false)
        .addGeneralSystem(patient, unicode);
    bool r11 = await Provider.of<MedicalProvider>(context, listen: false)
        .addSkinProblem(patient, unicode);
    bool r12 = await Provider.of<MedicalProvider>(context, listen: false)
        .addHeent(patient, unicode);
    bool r13 = await Provider.of<MedicalProvider>(context, listen: false)
        .addBreast(patient, unicode);
    bool r14 = await Provider.of<MedicalProvider>(context, listen: false)
        .addPulmonary(patient, unicode);
    bool r15 = await Provider.of<MedicalProvider>(context, listen: false)
        .addCardiovascular(patient, unicode);
    bool r16 = await Provider.of<MedicalProvider>(context, listen: false)
        .addGastroIntestinal(patient, unicode);
    bool r17 = await Provider.of<MedicalProvider>(context, listen: false)
        .addGenitourinary(patient, unicode);
    bool r18 = await Provider.of<MedicalProvider>(context, listen: false)
        .addGynecologic(patient, unicode);
    bool r19 = await Provider.of<MedicalProvider>(context, listen: false)
        .addEndocrine(patient, unicode);
    bool r20 = await Provider.of<MedicalProvider>(context, listen: false)
        .addMusculoskeletal(patient, unicode);
    bool r21 = await Provider.of<MedicalProvider>(context, listen: false)
        .addNeurologic(patient, unicode);
    bool r22 = await Provider.of<AppointmentProvider>(context, listen: false)
        .createAppointment(patient, unicode);
    if (r1 &&
        r2 &&
        r3 &&
        r4 &&
        r4 &&
        r5 &&
        r6 &&
        r7 &&
        r8 &&
        r9 &&
        r10 &&
        r11 &&
        r12 &&
        r13 &&
        r14 &&
        r15 &&
        r16 &&
        r17 &&
        r18 &&
        r19 &&
        r20 &&
        r21 &&
        r22) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: sendMedicalData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return SingleChildScrollView(
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
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          width: 250,
                          child:
                              Lottie.asset('assets/json/lottie/submitted.json'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Well done! Your medical history has been saved successfully.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            child: const Text(
                              'NEXT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              referralDialog(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
          return SingleChildScrollView(
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
          );
        },
      ),
    );
  }
}

// body: SingleChildScrollView(
//         physics: const NeverScrollableScrollPhysics(),
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 15),
//                 height: 130,
//                 child: Image.asset('assets/images/logos/rapha_logo_full.png'),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(bottom: 15),
//                 width: 100,
//                 child:
//                     Lottie.asset('assets/json/lottie/loading_submission.json'),
//               ),
//             ],
//           ),
//         ),
//       ),
