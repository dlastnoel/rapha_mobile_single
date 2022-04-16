import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../widgets/no_data_found.dart';

import '../screens/review_screen.dart';

import '../models/appointment.dart';

import '../preferences/patient_preferences.dart';
import '../preferences/appointment_preferences.dart';

import '../helpers/toasts.dart';
import '../routes/routing_constants.dart';

import '../providers/theme_provider.dart';
import '../providers/medical_provider.dart';

import '../widgets/dialogs.dart';

class RecentDataScreen extends StatefulWidget {
  const RecentDataScreen({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  @override
  State<RecentDataScreen> createState() => _RecentDataScreenState();
}

class _RecentDataScreenState extends State<RecentDataScreen> {
  final _patientPreferences = PatientPreferences();
  final _appointmentPreferenes = AppointmentPrefereces();
  List<Appointment> _patientData = [];
  initPatientData() async {
    _patientData = await Provider.of<MedicalProvider>(context, listen: false)
        .getPatientData(widget.status);
  }

  @override
  void initState() {
    initPatientData();
    print('STATUS: ' + widget.status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.status != 'done'
            ? const Text('Active Data List')
            : const Text('Past Medical Data List'),
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
                                child: widget.status == 'for_appointment'
                                    ? Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                            Expanded(
                                              flex: 2,
                                              child: ListTile(
                                                title: const Text(
                                                  'Active Medical Data',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  'Created: ' +
                                                      _patientData[index]
                                                          .dateCreated,
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
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              color: Colors.white,
                                              onPressed: () {
                                                deleteMedicalData(
                                                    context,
                                                    _patientData[index]
                                                        .unicode);
                                              },
                                            ),
                                          ])
                                    : ListTile(
                                        title: const Text(
                                          'Past Medical Data',
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReviewScreen(
                                      appointmentData: _patientData[index],
                                      status: widget.status,
                                    ),
                                  ),
                                );
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
