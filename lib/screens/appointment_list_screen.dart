import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../screens/review_screen.dart';

import '../models/appointment.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/appointment_preferences.dart';

import '../helpers/toasts.dart';
import '../routes/routing_constants.dart';

import '../providers/theme_provider.dart';
import '../providers/medical_provider.dart';

import '../widgets/no_data_found.dart';

class AppointmentListScreen extends StatefulWidget {
  const AppointmentListScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentListScreen> createState() => _AppointmentListScreenState();
}

class _AppointmentListScreenState extends State<AppointmentListScreen> {
  final _patientPreferences = PatientPreferences();
  final _appointmentPreferenes = AppointmentPrefereces();
  List<Appointment> _patientData = [];
  initPatientData() async {
    _patientData = await Provider.of<MedicalProvider>(context, listen: false)
        .getPatientData('has_appointment');
  }

  @override
  void initState() {
    initPatientData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
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
          child: _patientData.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 100,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Card(
                                child: ListTile(
                                  title: const Text(
                                    'Appointment Data',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Date of Appointment: ' +
                                        _patientData[index].checkupDate,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  leading: const Icon(
                                    Icons.edit_note,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                              onTap: () {
                                _appointmentPreferenes
                                    .setAppointmentData(_patientData[index].id);
                                _appointmentPreferenes
                                    .setUnicode(_patientData[index].unicode);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ReviewScreen(
                                //       appointmentData: _patientData[index],
                                //       status: 'has_appointment',
                                //     ),
                                //   ),
                                // );
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReviewScreen(
                                        appointmentData: _patientData[index],
                                        status: 'has_appointment',
                                      ),
                                    ),
                                    (route) => false);
                              },
                            );
                          },
                          itemCount: _patientData.length,
                        ),
                      ),
                    ],
                  ),
                )
              : noDataFoundWidget(context),
        ),
      ),
    );
  }
}
