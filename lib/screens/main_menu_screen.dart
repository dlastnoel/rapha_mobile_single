import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

import '../routes/routing_constants.dart';

import '../screens/select_patient_screen.dart';
import '../screens/doctors_list_screen.dart';
import '../screens/recent_data_list_screen.dart';

import '../widgets/dialogs.dart';
import '../widgets/no_internet_connection.dart';

class MainMenuScreen extends StatefulWidget {
  // constructor
  const MainMenuScreen({Key? key, required this.hasConnection})
      : super(key: key);
  final bool hasConnection;

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  // sets initial connection to false
  bool _connection = false;

  @override
  void initState() {
    // checks from previous screen if device has connection
    if (!widget.hasConnection) {
      InternetConnectionChecker().onStatusChange.listen((status) {
        setState(() {
          if (!widget.hasConnection) {
            _connection = status == InternetConnectionStatus.connected;
          }
          // if not sets connection to false and unable to proceed
          else {
            _connection = true;
          }
        });
      });
    }
    //sets connection to true based from previous scree
    else {
      _connection = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // init widget to display based from connection
    return _connection
        ? mainMenuWidget(context)
        : noInternetConnectionWidget(context);
  }
}

Widget mainMenuWidget(context) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Rapha Your Medical Friend'),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, preferencesScreenRoute);
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    ),
    body: DoubleBackToCloseApp(
      snackBar: const SnackBar(
        content: Text('Tap back again to exit'),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  Provider.of<ThemeProvider>(context).childBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height - 40),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    child: const Text(
                      'Enter Medical History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      privacyPolicy(context, demographicScreenRoute);
                    },
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              // Center(
              //   child: Container(
              //     width: MediaQuery.of(context).size.width - 100,
              //     decoration: BoxDecoration(
              //         color: Colors.blue,
              //         borderRadius: BorderRadius.circular(10)),
              //     child: TextButton(
              //       child: const Text(
              //         'VIEW RECENT DATA',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 20,
              //           color: Colors.white,
              //         ),
              //       ),
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) =>
              //                 const SelectPatientScreen(forCreate: false),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    child: const Text(
                      'My Appointments',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // ROUTE TO Appointments Screen
                      Navigator.pushNamed(context, appointmentListScreenRoute);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    child: const Text(
                      'Active Medical Data',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // ROUTE TO SELECT PATIENT, forCreate = false, status = for_appointment
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SelectPatientScreen(
                      //       forCreate: false,
                      //       status: 'for_appointment',
                      //     ),
                      //   ),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecentDataScreen(
                            status: 'for_appointment',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    child: const Text(
                      'Past Medical Data',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // ROUTE TO SELECT PATIENT, forCreate = false, status = done
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SelectPatientScreen(
                      //       forCreate: false,
                      //       status: 'done',
                      //     ),
                      //   ),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecentDataScreen(
                            status: 'done',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    child: const Text(
                      'View Doctors',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoctorsListScreen(
                            referral: false,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
