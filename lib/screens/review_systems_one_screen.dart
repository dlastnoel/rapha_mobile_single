import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

import '../routes/routing_constants.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class ReviewSystemsOneScreen extends StatefulWidget {
  const ReviewSystemsOneScreen({Key? key}) : super(key: key);

  @override
  State<ReviewSystemsOneScreen> createState() => _ReviewSystemsOneScreenState();
}

class _ReviewSystemsOneScreenState extends State<ReviewSystemsOneScreen> {
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();

  bool _fever = false;
  bool _fatigue = false;
  bool _weightChange = false;
  bool _weakness = false;
  bool _generalNone = false;

  bool _rashes = false;
  bool _lumps = false;
  bool _sores = false;
  bool _itching = false;
  bool _dryness = false;
  bool _changesInColor = false;
  bool _changesInHairNails = false;
  bool _skinProblemsNone = false;

  bool _headache = false;
  bool _dizziness = false;
  bool _lightheadedness = false;
  bool _changesInVision = false;
  bool _eyePain = false;
  bool _eyeRedness = false;
  bool _doubleVision = false;
  bool _wateryEyes = false;
  bool _poorHearing = false;
  bool _ringingEars = false;
  bool _earDischarge = false;
  bool _stuffyNose = false;
  bool _nasalDischarge = false;
  bool _nasalBleeding = false;
  bool _unusualOdors = false;
  bool _mouthSores = false;
  bool _alteredTaste = false;
  bool _soreTongue = false;
  bool _gumProblem = false;
  bool _soreThroat = false;
  bool _hoarseness = false;
  bool _swelling = false;
  bool _difficultySwallowing = false;
  bool _heentNone = false;

  bool _breastLumps = false;
  bool _nippleDischarge = false;
  bool _bleeding = false;
  bool _breastSwelling = false;
  bool _breastTenderness = false;
  bool _breastsNone = false;

  bool _cough = false;
  bool _sputumPhlegm = false;
  bool _bloodySputum = false;
  bool _paintInDeepBreath = false;
  bool _shortnessOfBreath = false;
  bool _pulmonaryNone = false;

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
                    'General/Systemic',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Fever'),
                  value: _fever,
                  onChanged: (value) {
                    setState(() {
                      _fever = value!;
                      _generalNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Fatigue'),
                  value: _fatigue,
                  onChanged: (value) {
                    setState(() {
                      _fatigue = value!;
                      _generalNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Recent weight change'),
                  value: _weightChange,
                  onChanged: (value) {
                    setState(() {
                      _weightChange = value!;
                      _generalNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Generalized weakness'),
                  value: _weakness,
                  onChanged: (value) {
                    setState(() {
                      _weakness = value!;
                      _generalNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _generalNone,
                  onChanged: (value) {
                    setState(() {
                      _generalNone = value!;
                      if (_generalNone) {
                        _fever = false;
                        _fatigue = false;
                        _weightChange = false;
                        _weakness = false;
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
                    'Skin Problems',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Rashes'),
                  value: _rashes,
                  onChanged: (value) {
                    setState(() {
                      _rashes = value!;
                      _skinProblemsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Lumps'),
                  value: _lumps,
                  onChanged: (value) {
                    setState(() {
                      _lumps = value!;
                      _skinProblemsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Sores'),
                  value: _sores,
                  onChanged: (value) {
                    setState(() {
                      _sores = value!;
                      _skinProblemsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Itching'),
                  value: _itching,
                  onChanged: (value) {
                    setState(() {
                      _itching = value!;
                      _skinProblemsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Dryness'),
                  value: _dryness,
                  onChanged: (value) {
                    setState(() {
                      _dryness = value!;
                      _skinProblemsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Changes in color'),
                  value: _changesInColor,
                  onChanged: (value) {
                    setState(() {
                      _changesInColor = value!;
                      _skinProblemsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Changes in hair or nails'),
                  value: _changesInHairNails,
                  onChanged: (value) {
                    setState(() {
                      _changesInHairNails = value!;
                      _skinProblemsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _skinProblemsNone,
                  onChanged: (value) {
                    setState(() {
                      _skinProblemsNone = value!;
                      if (_skinProblemsNone) {
                        _rashes = false;
                        _lumps = false;
                        _sores = false;
                        _itching = false;
                        _dryness = false;
                        _changesInColor = false;
                        _changesInHairNails = false;
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
                    'Head, Eyes, Ears, Nose, Throat (HEENT)',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Headache'),
                  value: _headache,
                  onChanged: (value) {
                    setState(() {
                      _headache = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Dizziness'),
                  value: _dizziness,
                  onChanged: (value) {
                    setState(() {
                      _dizziness = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Lightheadedness'),
                  value: _lightheadedness,
                  onChanged: (value) {
                    setState(() {
                      _lightheadedness = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Changes in vsion'),
                  value: _changesInVision,
                  onChanged: (value) {
                    setState(() {
                      _changesInVision = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Eye pain'),
                  value: _eyePain,
                  onChanged: (value) {
                    setState(() {
                      _eyePain = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Eye Redness'),
                  value: _eyeRedness,
                  onChanged: (value) {
                    setState(() {
                      _eyeRedness = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Double vision'),
                  value: _doubleVision,
                  onChanged: (value) {
                    setState(() {
                      _doubleVision = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Watery eyes'),
                  value: _wateryEyes,
                  onChanged: (value) {
                    setState(() {
                      _wateryEyes = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Poor hearing'),
                  value: _poorHearing,
                  onChanged: (value) {
                    setState(() {
                      _poorHearing = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Ringing ears'),
                  value: _ringingEars,
                  onChanged: (value) {
                    setState(() {
                      _ringingEars = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Ear discharge'),
                  value: _earDischarge,
                  onChanged: (value) {
                    setState(() {
                      _earDischarge = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Stuffy nose'),
                  value: _stuffyNose,
                  onChanged: (value) {
                    setState(() {
                      _stuffyNose = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Nasal discharge'),
                  value: _nasalDischarge,
                  onChanged: (value) {
                    setState(() {
                      _nasalDischarge = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Nasal bleeding'),
                  value: _nasalBleeding,
                  onChanged: (value) {
                    setState(() {
                      _nasalBleeding = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Unsual odors'),
                  value: _unusualOdors,
                  onChanged: (value) {
                    setState(() {
                      _unusualOdors = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Mouth sores'),
                  value: _mouthSores,
                  onChanged: (value) {
                    setState(() {
                      _mouthSores = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Altered Taste'),
                  value: _alteredTaste,
                  onChanged: (value) {
                    setState(() {
                      _alteredTaste = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Sore tongue'),
                  value: _soreTongue,
                  onChanged: (value) {
                    setState(() {
                      _soreTongue = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Gum problem'),
                  value: _gumProblem,
                  onChanged: (value) {
                    setState(() {
                      _gumProblem = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Sore throat'),
                  value: _soreThroat,
                  onChanged: (value) {
                    setState(() {
                      _soreThroat = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Hoarseness'),
                  value: _hoarseness,
                  onChanged: (value) {
                    setState(() {
                      _hoarseness = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Swelling'),
                  value: _swelling,
                  onChanged: (value) {
                    setState(() {
                      _swelling = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Difficulty swallowing'),
                  value: _difficultySwallowing,
                  onChanged: (value) {
                    setState(() {
                      _difficultySwallowing = value!;
                      _heentNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _heentNone,
                  onChanged: (value) {
                    setState(() {
                      _heentNone = value!;
                      if (_heentNone) {
                        _headache = false;
                        _dizziness = false;
                        _lightheadedness = false;
                        _changesInVision = false;
                        _eyePain = false;
                        _eyeRedness = false;
                        _doubleVision = false;
                        _wateryEyes = false;
                        _poorHearing = false;
                        _ringingEars = false;
                        _earDischarge = false;
                        _stuffyNose = false;
                        _nasalDischarge = false;
                        _nasalBleeding = false;
                        _unusualOdors = false;
                        _mouthSores = false;
                        _alteredTaste = false;
                        _soreTongue = false;
                        _gumProblem = false;
                        _soreThroat = false;
                        _hoarseness = false;
                        _swelling = false;
                        _difficultySwallowing = false;
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
                    'Breasts',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Breast lumps'),
                  value: _breastLumps,
                  onChanged: (value) {
                    setState(() {
                      _breastLumps = value!;
                      _breastsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Nipple discharge'),
                  value: _nippleDischarge,
                  onChanged: (value) {
                    setState(() {
                      _nippleDischarge = value!;
                      _breastsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Bleeding'),
                  value: _bleeding,
                  onChanged: (value) {
                    setState(() {
                      _bleeding = value!;
                      _breastsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Breast swelling'),
                  value: _breastSwelling,
                  onChanged: (value) {
                    setState(() {
                      _breastSwelling = value!;
                      _breastsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Breast tenderness'),
                  value: _breastTenderness,
                  onChanged: (value) {
                    setState(() {
                      _breastTenderness = value!;
                      _breastsNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _breastsNone,
                  onChanged: (value) {
                    setState(() {
                      _breastsNone = value!;
                      if (_breastsNone) {
                        _breastLumps = false;
                        _nippleDischarge = false;
                        _bleeding = false;
                        _breastSwelling = false;
                        _breastTenderness = false;
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
                    'Pulmonary',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Cough'),
                  value: _cough,
                  onChanged: (value) {
                    setState(() {
                      _cough = value!;
                      _pulmonaryNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Sputum/Phlegm'),
                  value: _sputumPhlegm,
                  onChanged: (value) {
                    setState(() {
                      _sputumPhlegm = value!;
                      _pulmonaryNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Bloody sputum'),
                  value: _bloodySputum,
                  onChanged: (value) {
                    setState(() {
                      _bloodySputum = value!;
                      _pulmonaryNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title:
                      const Text('Pain in the chest on taking a deep breath'),
                  value: _paintInDeepBreath,
                  onChanged: (value) {
                    setState(() {
                      _paintInDeepBreath = value!;
                      _pulmonaryNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Shortness of breath'),
                  value: _shortnessOfBreath,
                  onChanged: (value) {
                    setState(() {
                      _shortnessOfBreath = value!;
                      _pulmonaryNone = false;
                    });
                  },
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('None'),
                  value: _pulmonaryNone,
                  onChanged: (value) {
                    setState(() {
                      _pulmonaryNone = value!;
                      _cough = false;
                      _sputumPhlegm = false;
                      _bloodySputum = false;
                      _paintInDeepBreath = false;
                      _shortnessOfBreath = false;
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
                      Map<String, dynamic> generalSystemDetails = {
                        'patient': '',
                        'fever': _fever,
                        'fatigue': _fatigue,
                        'weight_change': _weightChange,
                        'weakness': _weakness,
                        'none': _generalNone,
                      };
                      Map<String, dynamic> skinProblemDetails = {
                        'patient': '',
                        'rashes': _rashes,
                        'lumps': _lumps,
                        'sores': _sores,
                        'itching': _itching,
                        'dryness': _dryness,
                        'changes_in_color': _changesInColor,
                        'changes_in_hair_nails': _changesInHairNails,
                        'none': _skinProblemsNone,
                      };
                      Map<String, dynamic> heentDetails = {
                        'patient': '',
                        'headache': _headache,
                        'dizziness': _dizziness,
                        'lightheadedness': _lightheadedness,
                        'changes_in_vision': _changesInVision,
                        'eye_pain': _eyePain,
                        'eye_redness': _eyeRedness,
                        'double_vision': _doubleVision,
                        'watery_eyes': _wateryEyes,
                        'poor_hearing': _poorHearing,
                        'ringing_ears': _ringingEars,
                        'ear_discharge': _earDischarge,
                        'stuffy_nose': _stuffyNose,
                        'nasal_discharge': _nasalDischarge,
                        'nasal_bleeding': _nasalBleeding,
                        'unusual_odors': _unusualOdors,
                        'mouth_sores': _mouthSores,
                        'altered_taste': _alteredTaste,
                        'sore_tongue': _soreTongue,
                        'gum_problem': _gumProblem,
                        'sore_throat': _soreThroat,
                        'hoarseness': _hoarseness,
                        'swelling': _swelling,
                        'diffuculty_swallowing': _difficultySwallowing,
                        'none': _heentNone,
                      };
                      Map<String, dynamic> breastsDetails = {
                        'patient': '',
                        'breast_lumps': _breastLumps,
                        'nipple_discharge': _nippleDischarge,
                        'bleeding': _bleeding,
                        'breast_swelling': _breastSwelling,
                        'breast_tenderness': _breastTenderness,
                        'none': _breastsNone
                      };
                      Map<String, dynamic> pulmonaryDetails = {
                        'patient': '',
                        'cough': _cough,
                        'sputum': _sputumPhlegm,
                        'bloody_sputum': _bloodySputum,
                        'chest_pain': _paintInDeepBreath,
                        'shortness_breath': _shortnessOfBreath,
                        'none': _pulmonaryNone,
                      };
                      _medicalPreferences
                          .setGeneralSystem(jsonEncode(generalSystemDetails));
                      _medicalPreferences
                          .setSkinProblem(jsonEncode(skinProblemDetails));
                      _medicalPreferences.setHeent(jsonEncode(heentDetails));
                      _medicalPreferences
                          .setBreasts(jsonEncode(breastsDetails));
                      _medicalPreferences
                          .setPulmonary(jsonEncode(pulmonaryDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addGeneralSystem();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addSkinProblem();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addHeent();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addBreast();
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addPulmonary();
                      Navigator.pushNamed(context, reviewSystemsTwoScreenRoute);
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
