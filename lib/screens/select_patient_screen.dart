import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/patient_provider.dart';

import '../preferences/patient_preferences.dart';
import '../models/patient.dart';

import 'recent_data_list_screen.dart';

import '../helpers/capitalize.dart';
import '../helpers/toasts.dart';
import '../routes/routing_constants.dart';

class SelectPatientScreen extends StatefulWidget {
  const SelectPatientScreen({
    Key? key,
    required this.forCreate,
    required this.status,
  }) : super(key: key);
  final bool forCreate;
  final String status;

  @override
  State<SelectPatientScreen> createState() => _SelectPatientScreenState();
}

class _SelectPatientScreenState extends State<SelectPatientScreen> {
  final _patientPreferences = PatientPreferences();
  List<Patient> _patients = [];
  String _selectedPatient = '';

  initPatients() async {
    _patients = await Provider.of<PatientProvider>(context, listen: false)
        .fetchPatients();
    _selectedPatient = await _patientPreferences.getPatient();
  }

  @override
  void initState() {
    initPatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Demographics'),
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
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 250,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      String _birth = DateFormat('MMMM dd, yyyy')
                          .format(_patients[index].dateOfBirth);
                      IconData _icon = _patients[index].sex == 'male'
                          ? Icons.boy
                          : Icons.girl;
                      return Card(
                        child: RadioListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: _patients[index].id,
                          onChanged: (value) {
                            setState(() {
                              _selectedPatient = value.toString();
                            });
                          },
                          groupValue: _selectedPatient,
                          title: Text(
                            _birth,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          secondary: Icon(
                            _icon,
                            size: 50,
                            color: Colors.white,
                          ),
                          subtitle: Text(
                            _patients[index].sex.capitalize() +
                                ' - ' +
                                _patients[index].maritalStatus.capitalize(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: _patients.length,
                  ),
                ),
                if (widget.forCreate) ...[
                  Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      child: const Text(
                        'CREATE NEW',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, demographicScreenRoute);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
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
                      onPressed: () {
                        if (_selectedPatient.isNotEmpty) {
                          _patientPreferences.setPatient(_selectedPatient);
                          print(_patientPreferences.getPatient);
                          Navigator.popAndPushNamed(
                              context, chiefComplaintScreenRoute);
                        } else {
                          Toasts.showEmptyErrorFieldToast();
                        }
                      },
                    ),
                  ),
                ] else ...[
                  Container(
                    height: 45,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      child: const Text(
                        'CONTINUE',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        if (_selectedPatient.isNotEmpty) {
                          PatientPreferences().setPatient(_selectedPatient);
                          // Navigator.pushNamed(context, recentDataScreenRoute);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecentDataScreen(
                                status: widget.status,
                              ),
                            ),
                          );
                        } else {
                          Toasts.showEmptyErrorFieldToast();
                        }
                      },
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
