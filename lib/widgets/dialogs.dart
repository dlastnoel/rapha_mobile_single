import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../configs/global.dart';

import '../providers/patient_provider.dart';
import '../providers/appointment_provider.dart';
import '../providers/client_provider.dart';

import '../preferences/appointment_preferences.dart';
import '../preferences/patient_preferences.dart';

import '../models/appointment.dart';
import '../models/schedule.dart';
import '../models/doctor.dart';
import '../models/timeslot.dart';

import '../screens/main_menu_screen.dart';
import '../screens/doctors_list_screen.dart';
import '../screens/select_patient_screen.dart';

import '../routes/routing_constants.dart';
import '../helpers/format_time_of_day.dart';

Future registrationDialog(context, String username, String contact) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Terms and Conditions'),
      content: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 48,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      Global.privacyPolicyText,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          child: const Text('OK'),
          // onPressed: () => Navigator.popAndPushNamed(
          //     context, loginScreenRoute),
          onPressed: () async {
            bool response =
                await Provider.of<ClientProvider>(context, listen: false)
                    .updateClient(username, contact);
            Navigator.pop(context);
            Navigator.pop(context, response);
          },
        )
      ],
    ),
  );
}

Future privacyPolicy(context, screenRoute) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Privacy Policy'),
      content: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width - 48,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      Global.privacyPolicyText,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, 'Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (screenRoute == demographicScreenRoute) {
              bool response =
                  await Provider.of<PatientProvider>(context, listen: false)
                      .hasPatients();
              if (response) {
                // Navigator.popAndPushNamed(context, selectPatientScreenRoute);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SelectPatientScreen(
                //         forCreate: true, status: 'for_appointment'),
                //   ),
                // );
                Navigator.pushNamed(context, chiefComplaintScreenRoute);
              } else {
                Navigator.pushNamed(context, demographicScreenRoute);
              }
            } else if (screenRoute == loadingSubmissionScreenRoute) {
              // Navigator.pushNamed(context, loadingSubmissionScreenRoute);
              Navigator.pushNamedAndRemoveUntil(
                  context, loadingSubmissionScreenRoute, (route) => false);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorsListScreen(
                    referral: true,
                  ),
                ),
              );
            }
          },

          // else {
          //       Navigator.pushNamed(context, demographicScreenRoute);
          //     }
          //   } else if(screenRoute == loadingSubmissionScreenRoute ) {
          //       Navigator.pushNamed(context,  loadingSubmissionScreenRoute);
          //     } else {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => const DoctorsListScreen(
          //                   referral: true,
          //                 ),
          //               ),
          //             );
          //     }
          child: const Text('OK'),
        )
      ],
    ),
  );
}

Future referralDialog(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Consult to a Doctor'),
      content: const Text(
          'Do you want to consult to a Doctor? You can do it later if you wish to.'),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MainMenuScreen(hasConnection: true),
                ),
                (route) => false);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DoctorsListScreen(
                  referral: true,
                ),
              ),
            );
          },
        )
      ],
    ),
  );
}

Future scheduleListDialog(context, String title, List<Schedule> schedules) {
  if (title.characters.last == 's') {
    title = title + '\'';
  } else {
    title = title + '\'s';
  }
  title = 'Dr. ' + title + ' Weekly Schedule';
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      content: SizedBox(
        height: 250,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(schedules[index].weekday + '(s)'),
                Text(schedules[index].start + ' - ' + schedules[index].end),
              ],
            );
          },
          itemCount: schedules.length,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
      ],
    ),
  );
}

// Future scheduleDialog(context, String doctor, DateTime limit) {
//   final _scheduleController = TextEditingController();
//   final _timeController = TextEditingController();
//   final dateOnlyFormat = DateFormat('MMMM dd, yyyy');

//   print(DateFormat('MMMM dd, yyyy').format(limit));
//   // final DateTime date = new DateTime(now.year, now.month, now.day);
//   return showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Refer to ' + doctor),
//         content: Stack(
//           clipBehavior: Clip.none,
//           alignment: Alignment.center,
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width - 48,
//               height: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   DateTimePicker(
//                     controller: _scheduleController,
//                     type: DateTimePickerType.date,
//                     dateMask: 'y-MM-dd',
//                     initialDate: DateTime.now().add(const Duration(days: 1)),
//                     firstDate: DateTime.now().add(const Duration(days: 1)),
//                     lastDate: DateTime(limit.year, limit.month, limit.day),
//                     icon: const Icon(Icons.event),
//                     dateLabelText: 'Date',
//                   ),
//                   Text(
//                     'Time',
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.4),
//                     ),
//                   ),
//                   TextFormField(
//                     readOnly: true,
//                     controller: _timeController,
//                     decoration: const InputDecoration(
//                       labelText: 'Time',
//                       labelStyle: TextStyle(),
//                       icon: Icon(
//                         Icons.access_time,
//                       ),
//                     ),
//                     onTap: () {
//                       showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                         initialEntryMode: TimePickerEntryMode.input,
//                         cancelText: 'Cancel',
//                         confirmText: 'Okay',
//                       ).then(
//                         (value) => {
//                           value != null
//                               ? _timeController.text =
//                                   value.format(context).toString()
//                               : _timeController.text = ''
//                         },
//                       );
//                     },
//                   )
//                   // Align(
//                   //   alignment: Alignment.centerLeft,
//                   //   child: TimePickerSpinner(
//                   //     itemHeight: 25,
//                   //     itemWidth: 30,
//                   //     is24HourMode: false,
//                   //     normalTextStyle: const TextStyle(
//                   //       fontSize: 13,
//                   //       color: Colors.grey,
//                   //     ),
//                   //     highlightedTextStyle: const TextStyle(
//                   //       fontSize: 20,
//                   //       fontWeight: FontWeight.bold,
//                   //       color: Colors.blue,
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () => Navigator.pop(context, 'Cancel'),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const DoctorsListScreen(
//                     referral: true,
//                   ),
//                 ),
//               );
//             },
//             child: const Text('Book'),
//           )
//         ],
//       );
//     },
//   );
// }

Future scheduleDialog(context, Doctor doctor, DateTime limit,
    List<Schedule> schedules, String appointmentId) {
  Schedule _schedule;
  List<Appointment> _appointments = [];
  List<TimeSlot> _timeSlots = [];
  bool _found = false;
  bool _isOpen = true;
  final _scheduleController = TextEditingController();
  final _timeController = TextEditingController();
  final _dateOnlyFormat = DateFormat('MMMM dd, yyyy');
  final _dateController = TextEditingController();
  final _patientPreferences = PatientPreferences();
  final _appointmentPreferences = AppointmentPrefereces();
  // String _patientId = '';
  // String _appointmentId = '';
  // String _appointmentUnicode = '';
  String _scheduleTitle = '';
  String _sendDate = '';
  String _checkupDate = '';
  int _index = 1;

  Iterable<TimeOfDay> getTimeSlots(
      TimeOfDay startTime, TimeOfDay endTime, Duration interval) sync* {
    var hour = startTime.hour;
    var minute = startTime.minute;

    do {
      yield TimeOfDay(hour: hour, minute: minute);
      minute += interval.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));

    // while (hour <= endTime.hour ||
    //     (hour == endTime.hour && minute <= endTime.minute)) {
    //   yield TimeOfDay(hour: hour, minute: minute);
    //   minute += interval.inMinutes;
    //   while (minute >= 60) {
    //     minute -= 60;
    //     hour++;
    //   }
    // }
  }

  // initPatientAppointments() async {
  //   _patientId = await _patientPreferences.getPatient();
  //   _appointmentId = await _appointmentPreferences.getAppointmentData();
  //   _appointmentUnicode = await _appointmentPreferences.getUnicode();
  // }

  initAppointments() async {
    _appointments =
        await Provider.of<AppointmentProvider>(context, listen: false)
            .getAppointments(doctor.id, _sendDate);
    if (appointmentId.isNotEmpty) {
      _isOpen = false;
    } else {
      _isOpen = true;
    }
  }

  print(DateFormat('MMMM dd, yyyy').format(limit));
  // final DateTime date = new DateTime(now.year, now.month, now.day);
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        Widget appointmentWidget(
          context,
          List<TimeSlot> timeSlots,
        ) {
          return SizedBox(
            height: MediaQuery.of(context).size.height - 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final String timeSlot =
                    timeSlots[index].start + ' - ' + timeSlots[index].end;

                // Get 12hour format time to display as timeslots
                final timeStart = TimeOfDay.fromDateTime(
                    DateFormat.jm().parse(timeSlots[index].start));
                final timeEnd = TimeOfDay.fromDateTime(
                    DateFormat.jm().parse(timeSlots[index].end));

                // Converts the 12hour format to datetime
                final now = DateTime.now();
                final dtStart = DateTime(now.year, now.month, now.day,
                    timeStart.hour, timeStart.minute);
                final dtEnd = DateTime(
                    now.year, now.month, now.day, timeEnd.hour, timeEnd.minute);

                // Data to be send to api as 24hr format string
                final String checkupStart = DateFormat.Hm().format(dtStart);
                final String checkupEnd = DateFormat.Hm().format(dtEnd);

                // print('CHECKUP START: ' + checkupStart);
                // print('CHECKUP END: ' + checkupEnd);

                bool isSlotMine = false;

                for (int i = 0; i < _appointments.length; i++) {
                  final checkupStart = TimeOfDay.fromDateTime(
                      DateFormat.jm().parse(_appointments[i].checkupStart));
                  final checkupEnd = TimeOfDay.fromDateTime(
                      DateFormat.jm().parse(_appointments[i].checkupEnd));
                  final String appointmentSlot = formatTimeOfDay(checkupStart) +
                      ' - ' +
                      formatTimeOfDay(checkupEnd);
                  // print(appointments[index].dateCreated);
                  if (appointmentSlot == timeSlot) {
                    if (appointmentId == _appointments[i].id) {
                      isSlotMine = true;
                    }
                    break;
                  }
                }

                return Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: const Text('Timeslot'),
                          subtitle: Text(timeSlot),
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                          // if the current patients does not have an appointment yet
                          _isOpen
                              ? TextButton(
                                  child: const Text(
                                    'Take slot',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue),
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.all(10)),
                                  ),
                                  onPressed: () async {
                                    bool result =
                                        await Provider.of<AppointmentProvider>(
                                                context,
                                                listen: false)
                                            .addPatientData(
                                                doctor.id,
                                                _checkupDate,
                                                checkupStart,
                                                checkupEnd);
                                    if (result) {
                                      // refresh data
                                      setState(() {
                                        initAppointments();
                                      });
                                    }
                                  },
                                )
                              :
                              // else
                              // checks if the current patient is the slot owner
                              isSlotMine
                                  ? TextButton(
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.blue),
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            const EdgeInsets.all(10)),
                                      ),
                                      onPressed: () async {
                                        // do something to cancel the appointment
                                        bool result = await Provider.of<
                                                    AppointmentProvider>(
                                                context,
                                                listen: false)
                                            .cancelPatientData();
                                        // Redirects to main menu
                                        Fluttertoast.showToast(
                                          msg: 'Appointment cancelled',
                                          toastLength: Toast.LENGTH_LONG,
                                        );
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainMenuScreen(
                                                      hasConnection: true),
                                            ),
                                            (route) => false);
                                      },
                                    )
                                  :
                                  // else if the patient is not the slot owner
                                  TextButton(
                                      child: const Text(
                                        'Closed',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.grey),
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            const EdgeInsets.all(10)),
                                      ),
                                      onPressed: () {
                                        // leave empty
                                      },
                                    ),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     height: 30,
                    //     decoration: BoxDecoration(
                    //       border: const Border(
                    //         bottom: BorderSide(
                    //           width: 1,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //       color: isSlotTaken ? Colors.grey : Colors.blue,
                    //     ),
                    //     child: isSlotTaken
                    //         ? isSlotMine
                    //             ? TextButton(
                    //                 child: const Text(
                    //                   'My Slot',
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //                 onPressed: () {
                    //                   null;
                    //                 },
                    //               )
                    //             : TextButton(
                    //                 child: const Text(
                    //                   'Slot Taken',
                    //                   style: TextStyle(
                    //                     color: Colors.white,
                    //                   ),
                    //                 ),
                    //                 onPressed: () {
                    //                   null;
                    //                 },
                    //               )
                    //         : TextButton(
                    //             child: const Text(
                    //               'Take slot',
                    //               style: TextStyle(
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //             onPressed: () async {
                    //               bool result =
                    //                   await Provider.of<AppointmentProvider>(
                    //                           context,
                    //                           listen: false)
                    //                       .addPatientData(
                    //                           doctor.id,
                    //                           _checkupDate,
                    //                           checkupStart,
                    //                           checkupEnd);
                    //               if (result) {
                    //                 // Fluttertoast.showToast(
                    //                 //   msg:
                    //                 //       'Slot successfully taken. Please refersh the page.',
                    //                 //   toastLength: Toast.LENGTH_LONG,
                    //                 // );
                    //                 setState(() async {
                    //                   initAppointments();
                    //                 });
                    //               }
                    //             },
                    //           ),
                    //     // TextButton(
                    //     //   child: Text(
                    //     //     isSlotTaken ? 'Slot Taken' : 'Take slot',
                    //     //     style: const TextStyle(
                    //     //       color: Colors.white,
                    //     //     ),
                    //     //   ),
                    //     //   onPressed: () {
                    //     //     print('HELLO WORLD');
                    //     //   },
                    //     // ),
                    //   ),
                    // ),
                  ],
                );
              },
              itemCount: timeSlots.length,
              // return const Text('HELLO WORLD');
            ),

            // child: ListView.builder(
            //   itemCount: 20,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Flex(
            //       direction: Axis.horizontal,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         const Expanded(
            //           flex: 2,
            //           child: ListTile(
            //             title: Text('Timeslot'),
            //             subtitle: Text('08:00 AM - 08:30 AM'),
            //           ),
            //         ),
            //         Expanded(
            //           child: Container(
            //             height: 30,
            //             decoration: BoxDecoration(
            //                 color: Colors.blue,
            //                 borderRadius: BorderRadius.circular(10)),
            //             child: TextButton(
            //               child: const Text(
            //                 'Take slot',
            //                 style: TextStyle(
            //                   color: Colors.white,
            //                 ),
            //               ),
            //               onPressed: () {
            //                 print('HELLO WORLD');
            //               },
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
          );
        }

        // Provider.of<AppointmentProvider>(context, listen: false)
        //     .getAppointments(doctor.id);
        // Provider.of<AppointmentProvider>(context, listen: false)
        //     .getAppointments(doctor.id);
        return AlertDialog(
          title: Text('Refer to Dr. ' + doctor.lastName),
          content: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width - 10,
                height: MediaQuery.of(context).size.height - 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DateTimePicker(
                      controller: _scheduleController,
                      type: DateTimePickerType.date,
                      dateMask: 'y-MM-dd',
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime.now().add(const Duration(days: 1)),
                      lastDate: DateTime(limit.year, limit.month, limit.day),
                      icon: const Icon(Icons.event),
                      dateLabelText: 'Date',
                      onChanged: (value) {
                        DateTime tempDate = (DateFormat('yyyy-MM-dd')
                            .parse(_scheduleController.text));
                        String currentDay =
                            (DateFormat('EEEE').format(tempDate)).toString();
                        for (int i = 0; i < schedules.length; i++) {
                          if (schedules[i].weekday == currentDay) {
                            setState(() {
                              _checkupDate = value;
                              _sendDate =
                                  (DateFormat('yyyy-MM-dd').format(tempDate))
                                      .toString();
                              print(_sendDate);
                              _found = true;
                              _scheduleTitle = currentDay;
                              _schedule = schedules[i];
                              initAppointments();
                              // initPatientAppointments();
                              print(_appointments);
                              print('SCHEDULE START: ' + _schedule.start);
                              print('SCHEDULE END: ' + _schedule.end);

                              final startTime = TimeOfDay.fromDateTime(
                                  DateFormat.jm().parse(_schedule.start));
                              final endTime = TimeOfDay.fromDateTime(
                                  DateFormat.jm().parse(_schedule.end));
                              // final endTime = TimeOfDay(
                              //     hour: int.parse(_schedule.end.split(":")[0]),
                              //     minute:
                              //         int.parse(_schedule.end.split(":")[1]));

                              final times = getTimeSlots(startTime, endTime,
                                      const Duration(minutes: 30))
                                  .toList();
                              for (int j = 0; j < times.length; j++) {
                                if (j + 1 < times.length) {
                                  _timeSlots.add(
                                    TimeSlot(
                                      start: formatTimeOfDay(times[j]),
                                      end: formatTimeOfDay(times[j + 1]),
                                    ),
                                  );
                                }
                              }

                              for (int k = 0; k < _timeSlots.length; k++) {
                                print(_timeSlots[k].start +
                                    ' - ' +
                                    _timeSlots[k].end);
                              }
                            });
                            break;
                          }
                          _found = false;
                          _scheduleTitle = 'No available schedule';
                        }
                      },
                    ),
                    Text(
                      'Time',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    _found
                        ? appointmentWidget(context, _timeSlots)
                        : Text(_scheduleTitle),
                    // TextFormField(
                    //   readOnly: true,
                    //   controller: _timeController,
                    //   decoration: const InputDecoration(`
                    //     labelText: 'Time',
                    //     labelStyle: TextStyle(),
                    //     icon: Icon(
                    //       Icons.access_time,
                    //     ),
                    //   ),
                    //   onTap: () {
                    //     showTimePicker(
                    //       context: context,
                    //       initialTime: TimeOfDay.now(),
                    //       initialEntryMode: TimePickerEntryMode.input,
                    //       cancelText: 'Cancel',
                    //       confirmText: 'Okay',
                    //     ).then(
                    //       (value) => {
                    //         value != null
                    //             ? _timeController.text =
                    //                 value.format(context).toString()
                    //             : _timeController.text = ''
                    //       },
                    //     );
                    //   },
                    // )
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: TimePickerSpinner(
                    //     itemHeight: 25,
                    //     itemWidth: 30,
                    //     is24HourMode: false,
                    //     normalTextStyle: const TextStyle(
                    //       fontSize: 13,
                    //       color: Colors.grey,
                    //     ),
                    //     highlightedTextStyle: const TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.blue,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Close'),
            ),
          ],
        );
      });
    },
  );
}

// Widget appointmentWidget(
//   context,
//   String appointmentId,
//   String checkupDate,
//   String sendDate,
//   List<Appointment> appointments,
//   List<TimeSlot> timeSlots,
//   String doctorId,
// ) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height - 300,
//     child: ListView.builder(
//       shrinkWrap: true,
//       itemBuilder: (context, index) {

//         final String timeSlot =
//             timeSlots[index].start + ' - ' + timeSlots[index].end;

//         // Get 12hour format time to display as timeslots
//         final timeStart = TimeOfDay.fromDateTime(
//             DateFormat.jm().parse(timeSlots[index].start));
//         final timeEnd =
//             TimeOfDay.fromDateTime(DateFormat.jm().parse(timeSlots[index].end));

//         // Converts the 12hour format to datetime
//         final now = DateTime.now();
//         final dtStart = DateTime(
//             now.year, now.month, now.day, timeStart.hour, timeStart.minute);
//         final dtEnd = DateTime(
//             now.year, now.month, now.day, timeEnd.hour, timeEnd.minute);

//         // Data to be send to api as 24hr format string
//         final String checkupStart = DateFormat.Hm().format(dtStart);
//         final String checkupEnd = DateFormat.Hm().format(dtEnd);

//         // print('CHECKUP START: ' + checkupStart);
//         // print('CHECKUP END: ' + checkupEnd);

//         bool isSlotTaken = false;
//         bool isSlotMine = false;

//         for (int i = 0; i < appointments.length; i++) {
//           final checkupStart = TimeOfDay.fromDateTime(
//               DateFormat.jm().parse(appointments[i].checkupStart));
//           final checkupEnd = TimeOfDay.fromDateTime(
//               DateFormat.jm().parse(appointments[i].checkupEnd));
//           final String appointmentSlot = formatTimeOfDay(checkupStart) +
//               ' - ' +
//               formatTimeOfDay(checkupEnd);
//           // print(appointments[index].dateCreated);
//           if (appointmentSlot == timeSlot) {
//             if (appointmentId == appointments[i].id) {
//               isSlotTaken = true;
//               isSlotMine = true;
//             }
//             break;
//           }
//         }

//         return Flex(
//           direction: Axis.horizontal,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       width: 1,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 child: ListTile(
//                   title: const Text('Timeslot'),
//                   subtitle: Text(timeSlot),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 height: 30,
//                 decoration: BoxDecoration(
//                   border: const Border(
//                     bottom: BorderSide(
//                       width: 1,
//                       color: Colors.grey,
//                     ),
//                   ),
//                   color: isSlotTaken ? Colors.grey : Colors.blue,
//                 ),
//                 child: isSlotTaken
//                     ? isSlotMine
//                         ? TextButton(
//                             child: const Text(
//                               'My Slot',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: () {
//                               null;
//                             },
//                           )
//                         : TextButton(
//                             child: const Text(
//                               'Slot Taken',
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: () {
//                               null;
//                             },
//                           )
//                     : TextButton(
//                         child: const Text(
//                           'Take slot',
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                         onPressed: () async {
//                           bool result = await Provider.of<AppointmentProvider>(
//                                   context,
//                                   listen: false)
//                               .addPatientData(doctorId, checkupDate,
//                                   checkupStart, checkupEnd);
//                           if (result) {
//                             Fluttertoast.showToast(
//                               msg:
//                                   'Slot successfully taken. Please refersh the page.',
//                               toastLength: Toast.LENGTH_LONG,
//                             );
//                             setState(() async {
//                               appointments =
//                                   await Provider.of<AppointmentProvider>(
//                                           context,
//                                           listen: false)
//                                       .getAppointments(doctorId, sendDate);
//                             });
//                           }
//                         },
//                       ),
//               ),
//             ),
//           ],
//         );
//       },
//       itemCount: timeSlots.length,
//     ),
//   );
// }

Future cancelAppointment(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Cancel Appointment?'),
      content: const Text('Do you wish to cancel your appointment?'),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const MainMenuScreen(hasConnection: true),
                ),
                (route) => false);
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () async {
            bool result =
                await Provider.of<AppointmentProvider>(context, listen: false)
                    .cancelPatientData();
            if (result) {
              Fluttertoast.showToast(
                msg: 'Appointment cancelled',
                toastLength: Toast.LENGTH_LONG,
              );
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }
          },
        )
      ],
    ),
  );
}

Future deleteMedicalData(context, String unicode) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Delete Medical Data'),
      content: const Text('Are you sure to delete your medical data?'),
      actions: <Widget>[
        TextButton(
          child: const Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () async {
            bool result =
                await Provider.of<AppointmentProvider>(context, listen: false)
                    .deleteMedicalData(unicode);
            if (result) {
              Fluttertoast.showToast(
                msg: 'Medical history data successfully deleted',
                toastLength: Toast.LENGTH_LONG,
              );
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }
          },
        )
      ],
    ),
  );
}
