import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class HistoryOfImmunizationScreen extends StatefulWidget {
  const HistoryOfImmunizationScreen({Key? key}) : super(key: key);

  @override
  State<HistoryOfImmunizationScreen> createState() =>
      _HistoryOfImmunizationScreenState();
}

class _HistoryOfImmunizationScreenState
    extends State<HistoryOfImmunizationScreen> {
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();

  final TextEditingController _surgeriesController = TextEditingController();
  final TextEditingController _medicineAllergiesController =
      TextEditingController();
  final TextEditingController _otherAllergieisController =
      TextEditingController();

  bool _hepatitisA = false;
  bool _hepatitisB = false;
  bool _polio = false;
  bool _measlesMumps = false;
  bool _influenza = false;
  bool _varicella = false;
  bool _influenzaTypeB = false;
  bool _pneumococcal = false;
  bool _meningococcal = false;
  bool _hpv = false;

  final TextEditingController _othersImmunizationController =
      TextEditingController();

  bool _tuberculosisTest = false;
  bool _stoolTest = false;
  bool _colonoscopy = false;
  bool _bloodTest = false;
  bool _xray = false;
  bool _ctScanUltrasound = false;
  bool _papSmears = false;
  bool _mammograms = false;

  final TextEditingController _screeningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Medical History'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Provider.of<ThemeProvider>(context).scrollableChildBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Surgeries and Hospitalizations',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _surgeriesController,
                  // minLines: 1,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    labelText:
                        'If you have any surgeries/hospitalizations in the past,\nwhat and when was it?',
                  ),
                ),
                TextFormField(
                  controller: _medicineAllergiesController,
                  // minLines: 1,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Allergies on certain medications? Specify',
                  ),
                ),
                TextFormField(
                  controller: _otherAllergieisController,
                  // minLines: 1,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    labelText:
                        'Allergies on other things like food, dust, insects, pollens? Specify',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'History of immunization',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 40,
                  ),
                  shrinkWrap: true,
                  children: [
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Hepatitis A'),
                      value: _hepatitisA,
                      onChanged: (value) {
                        setState(() => _hepatitisA = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Hepatitis B'),
                      value: _hepatitisB,
                      onChanged: (value) {
                        setState(() => _hepatitisB = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Polio'),
                      value: _polio,
                      onChanged: (value) {
                        setState(() => _polio = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Measles/Mumps'),
                      value: _measlesMumps,
                      onChanged: (value) {
                        setState(() => _measlesMumps = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Influenza'),
                      value: _influenza,
                      onChanged: (value) {
                        setState(() => _influenza = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Varicella'),
                      value: _varicella,
                      onChanged: (value) {
                        setState(() => _varicella = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Influenza Type B'),
                      value: _influenzaTypeB,
                      onChanged: (value) {
                        setState(() => _influenzaTypeB = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Pneumococcal'),
                      value: _pneumococcal,
                      onChanged: (value) {
                        setState(() => _pneumococcal = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Meningococcal'),
                      value: _meningococcal,
                      onChanged: (value) {
                        setState(() => _meningococcal = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Hpv'),
                      value: _hpv,
                      onChanged: (value) {
                        setState(() => _hpv = value!);
                      },
                    ),
                  ],
                ),
                TextFormField(
                  controller: _othersImmunizationController,
                  // minLines: 1,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Others, please specify',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Did you underwent screening for: (check if applicable)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Tuberculosis Test'),
                  value: _tuberculosisTest,
                  onChanged: (value) {
                    setState(() => _tuberculosisTest = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Stool Test'),
                  value: _stoolTest,
                  onChanged: (value) {
                    setState(() => _stoolTest = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Colonoscopy'),
                  value: _colonoscopy,
                  onChanged: (value) {
                    setState(() => _colonoscopy = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Blood Test (CBC)'),
                  value: _bloodTest,
                  onChanged: (value) {
                    setState(() => _bloodTest = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('X-ray'),
                  value: _xray,
                  onChanged: (value) {
                    setState(() => _xray = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('CT-Scan/Ultrasound'),
                  value: _ctScanUltrasound,
                  onChanged: (value) {
                    setState(() => _ctScanUltrasound = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Pap Smears (Females)'),
                  value: _papSmears,
                  onChanged: (value) {
                    setState(() => _papSmears = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Mammograms (Females)'),
                  value: _mammograms,
                  onChanged: (value) {
                    setState(() => _mammograms = value!);
                  },
                ),
                TextFormField(
                  controller: _screeningController,
                  // minLines: 1,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Others, please specify',
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
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () async {
                      Map<String, dynamic> historyOfImmunizationDetails = {
                        'surgeries': _surgeriesController.text,
                        'medical_allergies': _medicineAllergiesController.text,
                        'other_allergies': _otherAllergieisController.text,
                        'hepatitis_a': _hepatitisA,
                        'hepatitis_b': _hepatitisB,
                        'polio': _polio,
                        'measles': _measlesMumps,
                        'influenza': _influenza,
                        'varicella': _varicella,
                        'influenza_b': _influenzaTypeB,
                        'pneumococcal': _pneumococcal,
                        'meningococcal': _meningococcal,
                        'hpv': _hpv,
                        'others_immunization':
                            _othersImmunizationController.text,
                        'tuberculosis_test': _tuberculosisTest,
                        'stool_test': _stoolTest,
                        'colonoscopy': _colonoscopy,
                        'blood_test': _bloodTest,
                        'x_ray': _xray,
                        'ct_scan_ultrasound': _ctScanUltrasound,
                        'pap_smears': _papSmears,
                        'mammograms': _mammograms,
                        'others_test': _screeningController.text,
                      };
                      _medicalPreferences.setHistoryOfImmunization(
                          jsonEncode(historyOfImmunizationDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addHistoryOfImmunization();
                      Navigator.pushNamed(context, familyHistoryScreenRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
