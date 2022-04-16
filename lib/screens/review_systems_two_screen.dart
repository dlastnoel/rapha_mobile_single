import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

import '../providers/theme_provider.dart';

class ReviewSystemsTwoScreen extends StatefulWidget {
  const ReviewSystemsTwoScreen({Key? key}) : super(key: key);

  @override
  State<ReviewSystemsTwoScreen> createState() => _ReviewSystemsTwoScreenState();
}

class _ReviewSystemsTwoScreenState extends State<ReviewSystemsTwoScreen> {
  final _medicalPreferences = MedicalPreferences();

  bool _chestPain = false;
  bool _shortnessOfBreath = false;
  bool _palpitations = false;
  bool _cough = false;
  bool _swellingAnkles = false;
  bool _troubleInLying = false;
  bool _fatigue = false;
  bool _cardiovascularNone = false;

  bool _changesInAppetite = false;
  bool _nausea = false;
  bool _vomitting = false;
  bool _diarrhea = false;
  bool _constipation = false;
  bool _changesInBowelHabits = false;
  bool _bleedingFromRectum = false;
  bool _hemorrhoids = false;
  bool _decreasedCaliberStool = false;
  bool _gastroIntestinalNone = false;

  bool _painfulUrination = false;
  bool _increasedDecreasedFrequency = false;
  bool _bloodyCloudyUrine = false;
  bool _troubleUrination = false;
  bool _genitourinaryNone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review of Systems'),
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
                    'Do you feel any of the following? (Please check all applicable)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Cardiovascular',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Chest pain'),
                  value: _chestPain,
                  onChanged: (value) {
                    setState(() => _chestPain = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Shortness of breath'),
                  value: _shortnessOfBreath,
                  onChanged: (value) {
                    setState(() => _shortnessOfBreath = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Palpitations'),
                  value: _palpitations,
                  onChanged: (value) {
                    setState(() => _palpitations = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Cough'),
                  value: _cough,
                  onChanged: (value) {
                    setState(() => _cough = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Swelling of ankles'),
                  value: _swellingAnkles,
                  onChanged: (value) {
                    setState(() => _swellingAnkles = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Trouble in lying'),
                  value: _troubleInLying,
                  onChanged: (value) {
                    setState(() => _troubleInLying = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Fatigue'),
                  value: _fatigue,
                  onChanged: (value) {
                    setState(() => _fatigue = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _cardiovascularNone,
                  onChanged: (value) {
                    setState(() {
                      _cardiovascularNone = value!;
                      if (_cardiovascularNone) {
                        _chestPain = false;
                        _shortnessOfBreath = false;
                        _palpitations = false;
                        _cough = false;
                        _swellingAnkles = false;
                        _troubleInLying = false;
                        _fatigue = false;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Gastrointestinal',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Changes in appetite'),
                  value: _changesInAppetite,
                  onChanged: (value) {
                    setState(() => _changesInAppetite = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Nausea'),
                  value: _nausea,
                  onChanged: (value) {
                    setState(() => _nausea = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Vomitting'),
                  value: _vomitting,
                  onChanged: (value) {
                    setState(() => _vomitting = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Diarrhea'),
                  value: _diarrhea,
                  onChanged: (value) {
                    setState(() => _diarrhea = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Constipation'),
                  value: _constipation,
                  onChanged: (value) {
                    setState(() => _constipation = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Changes in bowel habits'),
                  value: _changesInBowelHabits,
                  onChanged: (value) {
                    setState(() => _changesInBowelHabits = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Bleeding from rectum'),
                  value: _bleedingFromRectum,
                  onChanged: (value) {
                    setState(() => _bleedingFromRectum = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Hemorrhoids'),
                  value: _hemorrhoids,
                  onChanged: (value) {
                    setState(() => _hemorrhoids = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Decreased caliber stool'),
                  value: _decreasedCaliberStool,
                  onChanged: (value) {
                    setState(() => _decreasedCaliberStool = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _gastroIntestinalNone,
                  onChanged: (value) {
                    setState(() {
                      _gastroIntestinalNone = value!;
                      if (_gastroIntestinalNone) {
                        _changesInAppetite = false;
                        _nausea = false;
                        _vomitting = false;
                        _diarrhea = false;
                        _constipation = false;
                        _changesInBowelHabits = false;
                        _bleedingFromRectum = false;
                        _hemorrhoids = false;
                        _decreasedCaliberStool = false;
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Genitourinary',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Painful urination'),
                  value: _painfulUrination,
                  onChanged: (value) {
                    setState(() => _painfulUrination = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Increased/decreased frequency'),
                  value: _increasedDecreasedFrequency,
                  onChanged: (value) {
                    setState(() => _increasedDecreasedFrequency = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Bloody/cloudy urine'),
                  value: _bloodyCloudyUrine,
                  onChanged: (value) {
                    setState(() => _bloodyCloudyUrine = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Trouble urination'),
                  value: _troubleUrination,
                  onChanged: (value) {
                    setState(() => _troubleUrination = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _genitourinaryNone,
                  onChanged: (value) {
                    setState(() {
                      _genitourinaryNone = value!;
                      if (_genitourinaryNone) {
                        _painfulUrination = false;
                        _increasedDecreasedFrequency = false;
                        _bloodyCloudyUrine = false;
                        _troubleUrination = false;
                      }
                    });
                  },
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
                      Map<String, dynamic> cardiovascularDetails = {
                        'chest_pain': _chestPain,
                        'shortness_of_breath': _shortnessOfBreath,
                        'palpitations': _palpitations,
                        'cough': _cough,
                        'swelling_of_ankles': _swellingAnkles,
                        'trouble_lying': _troubleInLying,
                        'fatigue': _fatigue,
                        'none': _cardiovascularNone,
                      };
                      Map<String, dynamic> gastroIntestinalDetails = {
                        'changes_in_appetite': _changesInAppetite,
                        'nausea': _nausea,
                        'vomitting': _vomitting,
                        'diarrhea': _diarrhea,
                        'constipation': _constipation,
                        'changes_in_bowel': _changesInBowelHabits,
                        'bleeding_rectum': _bleedingFromRectum,
                        'hemorrhoids': _hemorrhoids,
                        'decreased_stool': _decreasedCaliberStool,
                        'none': _gastroIntestinalNone,
                      };
                      Map<String, dynamic> genitourinaryDetails = {
                        'painful_urination': _painfulUrination,
                        'increased_decreased_frequency':
                            _increasedDecreasedFrequency,
                        'bloody_urine': _bloodyCloudyUrine,
                        'trouble_urination': _troubleUrination,
                        'none': _genitourinaryNone,
                      };
                      _medicalPreferences
                          .setCardiovascular(jsonEncode(cardiovascularDetails));
                      _medicalPreferences.setGastrointestinal(
                          jsonEncode(gastroIntestinalDetails));
                      _medicalPreferences
                          .setGenitourinary(jsonEncode(genitourinaryDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addCardiovascular();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addGastrointestinal();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addGenitourinary();
                      Navigator.pushNamed(
                          context, reviewSystemsThreeScreenRoute);
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
