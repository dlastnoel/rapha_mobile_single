import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../routes/routing_constants.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/medical_preferences.dart';

import '../providers/theme_provider.dart';
import '../providers/patient_provider.dart';
import '../providers/medical_provider.dart';

import '../helpers/toasts.dart';

class ChiefComplaintScreen extends StatefulWidget {
  const ChiefComplaintScreen({Key? key}) : super(key: key);

  @override
  State<ChiefComplaintScreen> createState() => _ChiefComplaintScreenState();
}

class _ChiefComplaintScreenState extends State<ChiefComplaintScreen> {
  final _patientPreferences = PatientPreferences();
  final _medicalPreferences = MedicalPreferences();
  final _uuid = Uuid();

  bool _cough = false;
  bool _pain = false;
  bool _weakness = false;
  bool _decreaseSenation = false;
  bool _rashes = false;
  bool _troubleBreathing = false;
  bool _vomitting = false;
  bool _voweling = false;
  final TextEditingController _othersController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chief Complaint',
        ),
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
            height: MediaQuery.of(context).size.height,
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
                  child:
                      Image.asset('assets/images/content/chief_complaint.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Present your symptoms below',
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
                      title: const Text('Cough'),
                      value: _cough,
                      onChanged: (value) {
                        setState(() => _cough = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Pain'),
                      value: _pain,
                      onChanged: (value) {
                        setState(() => _pain = value!);
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
                      title: const Text('Decrease Senation'),
                      value: _decreaseSenation,
                      onChanged: (value) {
                        setState(() => _decreaseSenation = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Rashes'),
                      value: _rashes,
                      onChanged: (value) {
                        setState(() => _rashes = value!);
                      },
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Trouble Breathing'),
                      value: _troubleBreathing,
                      onChanged: (value) {
                        setState(() => _troubleBreathing = value!);
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
                      title: const Text('Voweling'),
                      value: _voweling,
                      onChanged: (value) {
                        setState(() => _voweling = value!);
                      },
                    ),
                  ],
                ),
                TextFormField(
                  // minLines: 1,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Others, please specify',
                  ),
                  controller: _othersController,
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
                      if (!_cough == false ||
                          !_pain == false ||
                          !_weakness == false ||
                          !_decreaseSenation == false ||
                          !_rashes == false ||
                          !_troubleBreathing == false ||
                          !_vomitting == false ||
                          !_voweling == false ||
                          _othersController.text.isNotEmpty) {
                        Map<String, dynamic> chiefComplaintDetails = {
                          'patient': '',
                          'unicode': '',
                          'cough': _cough,
                          'pain': _pain,
                          'weakness': _weakness,
                          'decrease_sensation': _decreaseSenation,
                          'rashes': _rashes,
                          'trouble_breathing': _troubleBreathing,
                          'vomitting': _vomitting,
                          'voweling': _vomitting,
                          'others': _othersController.text,
                        };
                        // bool patientData =
                        //     await _patientPreferences.hasPatientData();
                        // String id = '';
                        // if (patientData) {
                        //   id = await Provider.of<PatientProvider>(context,
                        //           listen: false)
                        //       .addPatient();
                        // } else {
                        //   id = await _patientPreferences.getPatient();
                        // }
                        // chiefComplaintDetails['patient'] = id;
                        // chiefComplaintDetails['unicode'] =
                        //     _uuid.v4().toString();
                        _medicalPreferences.setChiefComplaint(
                            json.encode(chiefComplaintDetails));
                        // Provider.of<MedicalProvider>(context, listen: false)
                        //     .addChiefComplaint();
                        await Navigator.pushNamed(
                            context, presentIllnessPainterScreenRoute);
                      } else {
                        Toasts.showEmptyErrorFieldToast();
                      }
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
