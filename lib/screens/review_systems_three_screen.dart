import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

import '../providers/theme_provider.dart';

class ReviewSystemsThreeScreen extends StatefulWidget {
  const ReviewSystemsThreeScreen({Key? key}) : super(key: key);

  @override
  State<ReviewSystemsThreeScreen> createState() =>
      _ReviewSystemsThreeScreenState();
}

class _ReviewSystemsThreeScreenState extends State<ReviewSystemsThreeScreen> {
  final _medicalPreferences = MedicalPreferences();

  final TextEditingController _numberOfPregnanciesController =
      TextEditingController();
  final TextEditingController _miscarriagesController = TextEditingController();
  final TextEditingController _menstrualPeriodController =
      TextEditingController();

  String imageString = '';

  bool _irregularMenstration = false;
  bool _vaginalBleeding = false;
  bool _vaginalDischarge = false;
  bool _cessationOfPeriods = false;
  bool _hotFlashes = false;
  bool _vaginalItching = false;
  bool _sexualDysfunction = false;
  bool _gynecologicNone = false;

  bool _feelingHotOrCold = false;
  bool _fatigue = false;
  bool _changesInSkinOrHair = false;
  bool _movementTremors = false;
  bool _endocrineNone = false;

  bool _jointOrMusclePain = false;
  bool _stiffness = false;
  bool _limitationOfMotion = false;
  bool _muscleAtrophy = false;
  bool _muscleHypertrophy = false;
  bool _musculosSkeletalNone = false;

  bool _numbness = false;
  bool _weakness = false;
  bool _pinsAndNeedleSensation = false;
  bool _changesInMood = false;
  bool _changesInMemory = false;
  bool _tremors = false;
  bool _seizures = false;
  bool _neurologicNone = false;

  loadImageData() async {
    imageString = await _medicalPreferences.getPresentIllnessImage();
  }

  @override
  void initState() {
    loadImageData();
    super.initState();
  }

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
                    'Obstetric and Gynecologic',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('For females only'),
                ),
                TextFormField(
                  controller: _menstrualPeriodController,
                  decoration: const InputDecoration(
                    labelText: 'How many number of pregnancies did you have?',
                  ),
                ),
                TextFormField(
                  controller: _miscarriagesController,
                  decoration: const InputDecoration(
                    labelText: 'If there are miscarriages, how many?',
                  ),
                ),
                TextFormField(
                  controller: _menstrualPeriodController,
                  decoration: const InputDecoration(
                    labelText: 'When was your last mesnstrual period?',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'If you have gynecologic problems, please check all applicable'),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Irregular menstration'),
                  value: _irregularMenstration,
                  onChanged: (value) {
                    setState(() => _irregularMenstration = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Vaginal bleeding'),
                  value: _vaginalBleeding,
                  onChanged: (value) {
                    setState(() => _vaginalBleeding = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Vaginal discharge'),
                  value: _vaginalDischarge,
                  onChanged: (value) {
                    setState(() => _vaginalDischarge = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Cessation of periods'),
                  value: _cessationOfPeriods,
                  onChanged: (value) {
                    setState(() => _cessationOfPeriods = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Hot flashes'),
                  value: _hotFlashes,
                  onChanged: (value) {
                    setState(() => _hotFlashes = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Vaginal itching'),
                  value: _vaginalItching,
                  onChanged: (value) {
                    setState(() => _vaginalItching = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Sexual dysfunction'),
                  value: _sexualDysfunction,
                  onChanged: (value) {
                    setState(() => _sexualDysfunction = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _gynecologicNone,
                  onChanged: (value) {
                    setState(() {
                      _gynecologicNone = value!;
                      if (_gynecologicNone) {
                        _irregularMenstration = false;
                        _vaginalBleeding = false;
                        _vaginalDischarge = false;
                        _cessationOfPeriods = false;
                        _hotFlashes = false;
                        _vaginalItching = false;
                        _sexualDysfunction = false;
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
                    'Endocrine',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Feeling hot or cold'),
                  value: _feelingHotOrCold,
                  onChanged: (value) {
                    setState(() => _feelingHotOrCold = value!);
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
                  title: const Text('Changes in skin or hair'),
                  value: _changesInSkinOrHair,
                  onChanged: (value) {
                    setState(() => _changesInSkinOrHair = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Movement tremors/shaking'),
                  value: _movementTremors,
                  onChanged: (value) {
                    setState(() => _movementTremors = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _endocrineNone,
                  onChanged: (value) {
                    setState(() {
                      _endocrineNone = value!;
                      if (_endocrineNone) {
                        _feelingHotOrCold = false;
                        _fatigue = false;
                        _changesInSkinOrHair = false;
                        _movementTremors = false;
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
                    'Musculoskeletal',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Joint or muscle pain'),
                  value: _jointOrMusclePain,
                  onChanged: (value) {
                    setState(() => _jointOrMusclePain = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Stiffness'),
                  value: _stiffness,
                  onChanged: (value) {
                    setState(() => _stiffness = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Limitation of motion'),
                  value: _limitationOfMotion,
                  onChanged: (value) {
                    setState(() => _limitationOfMotion = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Muscle atrophy'),
                  value: _muscleAtrophy,
                  onChanged: (value) {
                    setState(() => _muscleAtrophy = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Muscle hypertrophy'),
                  value: _muscleHypertrophy,
                  onChanged: (value) {
                    setState(() => _muscleHypertrophy = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _musculosSkeletalNone,
                  onChanged: (value) {
                    setState(() {
                      _musculosSkeletalNone = value!;
                      if (_musculosSkeletalNone) {
                        _jointOrMusclePain = false;
                        _stiffness = false;
                        _limitationOfMotion = false;
                        _muscleAtrophy = false;
                        _muscleHypertrophy = false;
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
                    'Neurologic',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Numbness'),
                  value: _numbness,
                  onChanged: (value) {
                    setState(() => _numbness = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Weakness'),
                  value: _weakness,
                  onChanged: (value) {
                    setState(() => _weakness = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Pins and needle sensation'),
                  value: _pinsAndNeedleSensation,
                  onChanged: (value) {
                    setState(() => _pinsAndNeedleSensation = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Changes in mood'),
                  value: _changesInMood,
                  onChanged: (value) {
                    setState(() => _changesInMood = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Changes in memory'),
                  value: _changesInMemory,
                  onChanged: (value) {
                    setState(() => _changesInMemory = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Tremors'),
                  value: _tremors,
                  onChanged: (value) {
                    setState(() => _tremors = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Seizures'),
                  value: _seizures,
                  onChanged: (value) {
                    setState(() => _seizures = value!);
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _neurologicNone,
                  onChanged: (value) {
                    setState(() {
                      _neurologicNone = value!;
                      if (_neurologicNone) {
                        _numbness = false;
                        _weakness = false;
                        _pinsAndNeedleSensation = false;
                        _changesInMood = false;
                        _changesInMemory = false;
                        _tremors = false;
                        _seizures = false;
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
                      Map<String, dynamic> gynecologicDetails = {
                        'pregnancies': _numberOfPregnanciesController.text,
                        'miscarriages': _miscarriagesController.text,
                        'last_period': _menstrualPeriodController.text,
                        'irregular_menstration': _irregularMenstration,
                        'vaginal_bleeding': _vaginalBleeding,
                        'vaginal_discharge': _vaginalDischarge,
                        'cessation_of_periods': _cessationOfPeriods,
                        'hot_flashes': _hotFlashes,
                        'vaginal_itching': _vaginalItching,
                        'sexual_dysfunction': _sexualDysfunction,
                        'none': _gynecologicNone,
                      };
                      Map<String, dynamic> endocrineDetails = {
                        'hot_or_cold': _feelingHotOrCold,
                        'fatigue': _fatigue,
                        'changes_hair_skin': _changesInSkinOrHair,
                        'shaking': _movementTremors,
                        'none': _endocrineNone,
                      };
                      Map<String, dynamic> musculoskeletalDetails = {
                        'joints_muscle_pain': _jointOrMusclePain,
                        'stiffness': _stiffness,
                        'motion_limitation': _limitationOfMotion,
                        'muscle_atrophy': _muscleAtrophy,
                        'muscle_hypertrophy': _muscleHypertrophy,
                        'none': _musculosSkeletalNone,
                      };
                      Map<String, dynamic> neurologicDetails = {
                        'numbness': _numbness,
                        'weakness': _weakness,
                        'needle_sensation': _pinsAndNeedleSensation,
                        'changes_in_mood': _changesInMood,
                        'changes_in_memory': _changesInMemory,
                        'tremors': _tremors,
                        'seizures': _seizures,
                        'none': _neurologicNone,
                      };
                      _medicalPreferences
                          .setGynecologic(jsonEncode(gynecologicDetails));
                      _medicalPreferences
                          .setEndocrine(jsonEncode(endocrineDetails));
                      _medicalPreferences.setMusculoskeletal(
                          jsonEncode(musculoskeletalDetails));
                      _medicalPreferences
                          .setNeurologic(jsonEncode(neurologicDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addGynecologic();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addEndocrine();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addMusculoskeletal();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addNeurologic();
                      Navigator.pushNamed(
                          context, presentIllnessImageSummaryScreenRoute);
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
