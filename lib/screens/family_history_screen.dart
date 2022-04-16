import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class FamilyHistoryScreen extends StatefulWidget {
  const FamilyHistoryScreen({Key? key}) : super(key: key);

  @override
  State<FamilyHistoryScreen> createState() => _FamilyHistoryScreenState();
}

class _FamilyHistoryScreenState extends State<FamilyHistoryScreen> {
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();

  bool _hypertension = false;
  bool _diabetes = false;
  bool _stroke = false;
  bool _arthritis = false;
  bool _tuberculosis = false;
  bool _heartDisease = false;
  bool _thyroidRenalDisease = false;
  bool _asthmaLungDisease = false;

  final TextEditingController _othersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family History'),
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
                    'Does anyone in your family/relatives have the following illnesses? Please check all applicable:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Diabetes'),
                  value: _diabetes,
                  onChanged: (value) {
                    setState(() => _diabetes = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Hypertension'),
                  value: _hypertension,
                  onChanged: (value) {
                    setState(() => _hypertension = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Stroke'),
                  value: _stroke,
                  onChanged: (value) {
                    setState(() => _stroke = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Arthritis'),
                  value: _arthritis,
                  onChanged: (value) {
                    setState(() => _arthritis = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Tuberculosis'),
                  value: _tuberculosis,
                  onChanged: (value) {
                    setState(() => _tuberculosis = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Heart Disease'),
                  value: _heartDisease,
                  onChanged: (value) {
                    setState(() => _heartDisease = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Thyroid or renal diease'),
                  value: _thyroidRenalDisease,
                  onChanged: (value) {
                    setState(() => _thyroidRenalDisease = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Asthma or lung disease'),
                  value: _asthmaLungDisease,
                  onChanged: (value) {
                    setState(() => _asthmaLungDisease = value!);
                  },
                ),
                TextFormField(
                  controller: _othersController,
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
                      Map<String, dynamic> familyHistoryDetails = {
                        'diabetes': _diabetes,
                        'hypertension': _hypertension,
                        'stroke': _stroke,
                        'arthritis': _arthritis,
                        'tuberculosis': _tuberculosis,
                        'heart_disease': _heartDisease,
                        'thyroid': _thyroidRenalDisease,
                        'asthma': _asthmaLungDisease,
                        'others': _othersController.text,
                      };
                      _medicalPreferences
                          .setFamilyHistory(jsonEncode(familyHistoryDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addFamilyHistory();
                      Navigator.pushNamed(
                          context, personalSocialHistoryScreenRoute);
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
