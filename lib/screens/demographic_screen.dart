import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import '../preferences/patient_preferences.dart';

import '../helpers/toasts.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

class DemographicScreen extends StatefulWidget {
  const DemographicScreen({Key? key}) : super(key: key);

  @override
  State<DemographicScreen> createState() => _DemographicScreenState();
}

class _DemographicScreenState extends State<DemographicScreen> {
  final _patientPreferences = PatientPreferences();
  String _sex = '';
  String _maritalStatus = 'single';
  final TextEditingController _dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demographic Profile'),
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
                      'assets/images/content/demographic_profile.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                DateTimeField(
                  controller: _dateOfBirthController,
                  decoration: const InputDecoration(
                    hintText: 'Date of Birth',
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
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text(
                    'Sex',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 50,
                      child: RadioListTile(
                        value: 'male',
                        groupValue: _sex,
                        title: const Text('Male'),
                        onChanged: (String? value) {
                          setState(() {
                            _sex = value.toString();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: RadioListTile(
                        value: 'female',
                        groupValue: _sex,
                        title: const Text('Female'),
                        onChanged: (String? value) {
                          setState(() {
                            _sex = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Marital Status'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 150,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _maritalStatus,
                          items: const [
                            DropdownMenuItem(
                              child: Text('Single'),
                              value: 'single',
                            ),
                            DropdownMenuItem(
                              child: Text('Married'),
                              value: 'married',
                            ),
                            DropdownMenuItem(
                              child: Text('Separated'),
                              value: 'separated',
                            ),
                            DropdownMenuItem(
                              child: Text('Widowed'),
                              value: 'widowed',
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              _maritalStatus = value.toString();
                            });
                          },
                          hint: const Text('Select item')),
                    ),
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
                      if (_dateOfBirthController.text.isNotEmpty &&
                          _sex.isNotEmpty &&
                          _maritalStatus.isNotEmpty) {
                        Map<String, dynamic> patientDetails = {
                          'client': '',
                          'code': '',
                          'date_of_birth':
                              _dateOfBirthController.text.toString(),
                          'sex': _sex,
                          'marital_status': _maritalStatus,
                        };
                        _patientPreferences
                            .setPatientDetails(jsonEncode(patientDetails));
                        // Provider.of<PatientProvider>(context, listen: false)
                        //     .addPatient();
                        Navigator.pushNamed(context, chiefComplaintScreenRoute);
                      } else {
                        Toasts.showErrorFieldToast();
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
