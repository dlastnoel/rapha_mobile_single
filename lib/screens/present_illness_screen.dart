import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class PresentIllnessScreen extends StatefulWidget {
  const PresentIllnessScreen({Key? key}) : super(key: key);

  @override
  State<PresentIllnessScreen> createState() => _PresentIllnessScreenState();
}

class _PresentIllnessScreenState extends State<PresentIllnessScreen> {
  String? _severity;

  final TextEditingController _symptomsStarted = TextEditingController();
  final TextEditingController _howOften = TextEditingController();
  final TextEditingController _howLong = TextEditingController();
  final TextEditingController _describe = TextEditingController();

  bool _walking = false;
  bool _bathing = false;
  bool _dressing = false;
  bool _eating = false;
  bool _hygieneGrooming = false;
  bool _sleeping = false;
  bool _toiletHygiene = false;
  bool _sexualActivity = false;
  bool _bowel = false;
  bool _urination = false;

  final TextEditingController _symptomWorse = TextEditingController();
  final TextEditingController _improveSymptom = TextEditingController();
  final TextEditingController _symptomFeel = TextEditingController();
  final TextEditingController _medication = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _patientPreferences = PatientPreferences();
    final _medicalPreferences = MedicalPreferences();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Present Illness'),
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
                DateTimeField(
                  controller: _symptomsStarted,
                  decoration: const InputDecoration(
                    hintText: 'When did the symptom started?',
                  ),
                  format: DateFormat('y-MM-dd'),
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
                TextFormField(
                  controller: _howOften,
                  decoration: const InputDecoration(
                    labelText: 'When and how often do you feel it?',
                  ),
                ),
                TextFormField(
                  controller: _howLong,
                  decoration: const InputDecoration(
                    labelText: 'How long does it usually last?',
                  ),
                ),
                TextFormField(
                  controller: _describe,
                  decoration: const InputDecoration(
                    labelText:
                        'Describe and elaborate the symptom you are feeling.',
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _severity,
                          items: const [
                            DropdownMenuItem(
                              child: Text('Mild'),
                              value: 'mild',
                            ),
                            DropdownMenuItem(
                              child: Text('Moderate'),
                              value: 'moderate',
                            ),
                            DropdownMenuItem(
                              child: Text('Severe'),
                              value: 'severe',
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              _severity = value.toString();
                            });
                          },
                          hint: const Text('Is it mild, moderate or severe?')),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text('Is it affecting your activities of daily living?',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          )),
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
                      title: const Text('Walking'),
                      value: _walking,
                      onChanged: (value) {
                        setState(() => _walking = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Bathing'),
                      value: _bathing,
                      onChanged: (value) {
                        setState(() => _bathing = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Dressing'),
                      value: _dressing,
                      onChanged: (value) {
                        setState(() => _dressing = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Eating'),
                      value: _eating,
                      onChanged: (value) {
                        setState(() => _eating = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Hygiene/Grooming'),
                      value: _hygieneGrooming,
                      onChanged: (value) {
                        setState(() => _hygieneGrooming = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Sleeping'),
                      value: _sleeping,
                      onChanged: (value) {
                        setState(() => _sleeping = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Toilet Hygiene'),
                      value: _toiletHygiene,
                      onChanged: (value) {
                        setState(() => _toiletHygiene = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Sexual Activity'),
                      value: _sexualActivity,
                      onChanged: (value) {
                        setState(() => _sexualActivity = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Bowel movement'),
                      value: _bowel,
                      onChanged: (value) {
                        setState(() => _bowel = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Urination'),
                      value: _urination,
                      onChanged: (value) {
                        setState(() => _urination = value!);
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Is it affecting your ambulation, work and recreational activities?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _symptomWorse,
                  decoration: const InputDecoration(
                    labelText:
                        'Enumerate the activities makes the symptom worse.',
                  ),
                ),
                TextFormField(
                  controller: _improveSymptom,
                  decoration: const InputDecoration(
                    labelText:
                        'Enumerate the activities that improves the symptoms.',
                  ),
                ),
                TextFormField(
                  controller: _symptomFeel,
                  decoration: const InputDecoration(
                    labelText: 'What other symptoms do you feel?',
                  ),
                ),
                TextFormField(
                  controller: _medication,
                  decoration: const InputDecoration(
                    labelText:
                        'Enumerate all the medications your taking right now.',
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
                      Map<String, dynamic> presentIllnessDetails = {
                        'patient': '',
                        'symptoms_started': _symptomsStarted.text,
                        'how_often': _howOften.text,
                        'how_long': _howLong.text,
                        'describe': _describe.text,
                        'severity': _severity,
                        'affects_walking': _walking,
                        'affects_bathing': _bathing,
                        'affects_dressing': _dressing,
                        'affects_eating': _eating,
                        'affects_hygiene': _hygieneGrooming,
                        'affects_sleeping': _sleeping,
                        'affects_toilet': _toiletHygiene,
                        'affects_sex': _sexualActivity,
                        'affects_bowel': _bowel,
                        'affects_urination': _urination,
                        'activities_worse': _symptomWorse.text,
                        'activities_improves': _improveSymptom.text,
                        'other_symptoms': _symptomFeel.text,
                        'medications': _medication.text,
                      };
                      _medicalPreferences
                          .setPresentIllness(jsonEncode(presentIllnessDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addPresentIllness();
                      Navigator.pushNamed(context, childhoodIllnessScreenRoute);
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
