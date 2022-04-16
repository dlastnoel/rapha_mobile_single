import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

class FunctionalHistoryScreen extends StatefulWidget {
  const FunctionalHistoryScreen({Key? key}) : super(key: key);

  @override
  State<FunctionalHistoryScreen> createState() =>
      _FunctionalHistoryScreenState();
}

class _FunctionalHistoryScreenState extends State<FunctionalHistoryScreen> {
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();

  bool _mobility = false;
  bool _bathing = false;
  bool _dressing = false;
  bool _eating = false;
  bool _hygieneGrooming = false;
  bool _sleeping = false;
  bool _toiletHygiene = false;
  bool _sexualActivity = false;
  bool _defacate = false;
  bool _urination = false;

  String? _assistiveDevice;
  String? _drive;
  String? _support;

  final TextEditingController _assistiveDevicesController =
      TextEditingController();
  final TextEditingController _acitivitiesDifficultController =
      TextEditingController();
  final TextEditingController _assistanceController = TextEditingController();
  final TextEditingController _difficultyInComplicatedController =
      TextEditingController();
  final TextEditingController _verbalCommunicationControler =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Functional History'),
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
                    'Can you walk alone without any asistance? If no, do you need an assistive device like cane, walker or wheelchair?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _assistiveDevice,
                          items: const [
                            DropdownMenuItem(
                              child: Text('Yes, I use a cane.'),
                              value: 'cane',
                            ),
                            DropdownMenuItem(
                              child: Text('Yes, I use a walker.'),
                              value: 'walker',
                            ),
                            DropdownMenuItem(
                              child: Text('Yes, I use a wheelchair.'),
                              value: 'wheelchair',
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              _assistiveDevice = value.toString();
                            });
                          },
                          hint: const Text('Select item')),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Can you drive on your own?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _drive,
                          items: const [
                            DropdownMenuItem(
                              child: Text('No.'),
                              value: 'no',
                            ),
                            DropdownMenuItem(
                              child: Text('Yes.'),
                              value: 'yes',
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              _drive = value.toString();
                            });
                          },
                          hint: const Text('Select item')),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Can you do activities of daily living on your own like bathing, eating, dressing and grooming? If no,what activities of daily living do you have difficulty? Please check all applicable.',
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
                      title: const Text('Mobility'),
                      value: _mobility,
                      onChanged: (value) {
                        setState(() => _mobility = value!);
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
                      title: const Text('Defacate'),
                      value: _defacate,
                      onChanged: (value) {
                        setState(() => _defacate = value!);
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
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Do you need a helper on the activities that you have difficulties? If yes, how much support do you need?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _support,
                          items: const [
                            DropdownMenuItem(
                              child: Text('100%'),
                              value: '100%',
                            ),
                            DropdownMenuItem(
                              child: Text('75%'),
                              value: '75%',
                            ),
                            DropdownMenuItem(
                              child: Text('50%'),
                              value: '50%',
                            ),
                            DropdownMenuItem(
                              child: Text('25%'),
                              value: '25%',
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              _support = value.toString();
                            });
                          },
                          hint: const Text('Select item')),
                    ),
                  ),
                ),
                TextFormField(
                  controller: _assistiveDevicesController,
                  decoration: const InputDecoration(
                    labelText: 'If you use assistive devices, identify here',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Can you do the laundry, prepare your meals, goes to the church or market on your own? If no,',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _acitivitiesDifficultController,
                  decoration: const InputDecoration(
                    labelText:
                        'Identify the activities where you have difficulties in',
                  ),
                ),
                TextFormField(
                  controller: _assistanceController,
                  decoration: const InputDecoration(
                    labelText: 'Describe the assistance you need if any',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Do you have difficulty remembering things and doing complicated tasks? If yes,',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _difficultyInComplicatedController,
                  decoration: const InputDecoration(
                    labelText: 'Describe it here',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Do you have difficulty with verbal communciation? If yes,',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _verbalCommunicationControler,
                  decoration: const InputDecoration(
                    labelText: 'How do you communicate with others?',
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
                      Map<String, dynamic> funcitionalHistoryDetails = {
                        'assistive_walking': _assistiveDevice,
                        'drive_own': _drive,
                        'affects_walking': _mobility,
                        'affects_bathing': _bathing,
                        'affects_dressing': _dressing,
                        'affects_eating': _eating,
                        'affects_hygiene': _hygieneGrooming,
                        'affects_sleeping': _sleeping,
                        'affects_toilet': _toiletHygiene,
                        'affects_sex': _sexualActivity,
                        'affects_bowel': _defacate,
                        'affects_urination': _urination,
                        'needs_support': _support,
                        'assistive_devices': _assistiveDevicesController.text,
                        'difficulties_activities':
                            _acitivitiesDifficultController.text,
                        'difficulties_assistance':
                            _acitivitiesDifficultController.text,
                        'difficulties_in_complicated':
                            _difficultyInComplicatedController.text,
                        'difficulties_in_verbal':
                            _verbalCommunicationControler.text,
                      };
                      _medicalPreferences.setFunctionalHistory(
                          jsonEncode(funcitionalHistoryDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addFunctionalHistory();
                      Navigator.pushNamed(context, reviewSystemsOneScreenRoute);
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
