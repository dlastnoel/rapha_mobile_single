import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

import '../models/appointment.dart';

import '../screens/main_menu_screen.dart';

import './dialogs.dart';

Widget appointmentSummary(context, Appointment appointment, String status,
    String doctor, String specialization) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          Provider.of<ThemeProvider>(context).appointmentSummaryBg,
        ),
        fit: BoxFit.fitHeight,
      ),
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Appointment Summary',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text('• Consulted doctor: ' + doctor),
        Text('• Specialization: ' + specialization),
        Text('• Date of appointment: ' + appointment.checkupDate),
        Text('• Time: ' +
            appointment.checkupStart +
            ' - ' +
            appointment.checkupEnd),
        if (status == 'done') ...[
          Text('• Doctor\'s Statement: ' + appointment.statement),
        ],
        if (status == 'has_appointment') ...[
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width - 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  child: const Text(
                    'Cancel Appointment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    // ROUTE TO Appointments Screen
                    cancelAppointment(context);
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width - 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                child: const Text(
                  'Back to Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const MainMenuScreen(hasConnection: true),
                      ),
                      (route) => false);
                },
              ),
            ),
          ),
        ],
        if (status != 'has_appointment') ...[
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: TextButton(
                child: const Text(
                  'Back to Home',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(10)),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const MainMenuScreen(hasConnection: true),
                      ),
                      (route) => false);
                },
              ),
            ),
          ),
        ]
      ],
    ),
  );
}
