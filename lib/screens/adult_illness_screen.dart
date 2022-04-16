import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class AdultIllnessScreen extends StatefulWidget {
  const AdultIllnessScreen({Key? key}) : super(key: key);

  @override
  State<AdultIllnessScreen> createState() => _AdultIllnessScreenState();
}

class _AdultIllnessScreenState extends State<AdultIllnessScreen> {
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();

  bool _diabetes = false;
  bool _hypertension = false;
  bool _stroke = false;
  bool _arthritis = false;
  bool _tuberculosis = false;
  bool _heartDisease = false;
  bool _thyroid = false;
  bool _asthma = false;
  final TextEditingController _othersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Medical History'),
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
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  height: 130,
                  child: Image.asset('assets/images/content/adult_illness.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Adult Illness',
                    style: TextStyle(
                      fontSize: 20,
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
                      title: const Text('Thyroid'),
                      value: _thyroid,
                      onChanged: (value) {
                        setState(() => _thyroid = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Asthma'),
                      value: _asthma,
                      onChanged: (value) {
                        setState(() => _asthma = value!);
                      },
                    ),
                  ],
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
                      Map<String, dynamic> adultIllnessDetails = {
                        'diabetes': _diabetes,
                        'hypertension': _hypertension,
                        'stroke': _stroke,
                        'arthritis': _arthritis,
                        'tuberculosis': _tuberculosis,
                        'heart_disease': _heartDisease,
                        'thyroid': _thyroid,
                        'asthma': _asthma,
                        'others': _othersController.text,
                      };
                      _medicalPreferences
                          .setAdultIllness(jsonEncode(adultIllnessDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addAdultIllness();
                      Navigator.pushNamed(
                          context, historyOfImmunizationScreenRoute);
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
