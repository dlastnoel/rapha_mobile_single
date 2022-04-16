import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class ChildIllnessScreen extends StatefulWidget {
  const ChildIllnessScreen({Key? key}) : super(key: key);

  @override
  State<ChildIllnessScreen> createState() => _ChildIllnessScreenState();
}

class _ChildIllnessScreenState extends State<ChildIllnessScreen> {
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();

  bool _measles = false;
  bool _mumps = false;
  bool _rubella = false;
  bool _asthma = false;
  bool _primaryComplex = false;
  bool _chickenPox = false;
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
                  child: Image.asset(
                      'assets/images/content/childhood_illness.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Childhood Illness',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 45,
                  ),
                  shrinkWrap: true,
                  children: [
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Measles'),
                      value: _measles,
                      onChanged: (value) {
                        setState(() => _measles = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Mumps'),
                      value: _mumps,
                      onChanged: (value) {
                        setState(() => _mumps = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Rubella'),
                      value: _rubella,
                      onChanged: (value) {
                        setState(() => _rubella = value!);
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
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Primary complex/TB'),
                      value: _primaryComplex,
                      onChanged: (value) {
                        setState(() => _primaryComplex = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Chicken Pox'),
                      value: _chickenPox,
                      onChanged: (value) {
                        setState(() => _chickenPox = value!);
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
                      Map<String, dynamic> childHoodIllnessData = {
                        'patient': '',
                        'measles': _measles,
                        'mumps': _mumps,
                        'rubella': _rubella,
                        'asthma': _asthma,
                        'primary_complex': _primaryComplex,
                        'chicken_pox': _chickenPox,
                        'others': _othersController.text,
                      };
                      _medicalPreferences.setChildHoodIllness(
                          jsonEncode(childHoodIllnessData));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addChildhoodIllness();
                      Navigator.pushNamed(context, adultIllnessScreenRoute);
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
