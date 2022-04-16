// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/theme_provider.dart';
// import '../providers/doctor_provider.dart';

// import '../models/doctor.dart';

// class DoctorScreen extends StatefulWidget {
//   const DoctorScreen({Key? key}) : super(key: key);

//   @override
//   State<DoctorScreen> createState() => _DoctorScreenState();
// }

// class _DoctorScreenState extends State<DoctorScreen> {
//   Doctor? _doctor;

//   initDoctor() async {
//     _doctor =
//         await Provider.of<DoctorProvider>(context, listen: false).getDoctor();
//   }

//   @override
//   void initState() {
//     initDoctor();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('View Doctor'),
//       ),
//       body: SingleChildScrollView(
//         physics: const NeverScrollableScrollPhysics(),
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 Provider.of<ThemeProvider>(context).childBackground,
//               ),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Image(
//               image: Image.network(_doctor?.profileImageUrl ?? '0').image,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/theme_provider.dart';
// import '../providers/doctor_provider.dart';

// import '../models/doctor.dart';

// class DoctorScreen extends StatefulWidget {
//   const DoctorScreen({Key? key}) : super(key: key);

//   @override
//   State<DoctorScreen> createState() => _DoctorScreenState();
// }

// class _DoctorScreenState extends State<DoctorScreen> {
//   Doctor? _doctor;

//   initDoctor() async {
//     _doctor =
//         await Provider.of<DoctorProvider>(context, listen: false).getDoctor();
//   }

//   @override
//   void initState() {
//     initDoctor();
//     super.initState();
//   }

//   final double coverHeight = 190;
//   final double profileHeight = 160;

//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     final double topProfile = coverHeight - profileHeight / 2;

//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('View Doctor'),
//         ),
//         body: Column(
//           children: [
//             Stack(
//               alignment: Alignment.center,
//               clipBehavior: Clip.none,
//               children: [
//                 _buildCoverImage(),
//                 Positioned(
//                   top: topProfile,
//                   child: _buildProfileImage(),
//                 ),
//               ],
//             ),

//             _buildProfileInfo(),
//           ],
//         ));
//   }

//   _buildCoverImage() {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             'assets/images/background/hospital.jpg',
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//       width: double.infinity,
//       height: coverHeight,
//     );
//   }

//   _buildProfileImage() {
//     return CircleAvatar(
//       radius: profileHeight / 2,
//       backgroundColor: Colors.green,
//       backgroundImage: Image.network(_doctor?.profileImageUrl ?? '0').image,
//     );
//   }

//   _buildProfileInfo() => Column(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 Text(
//                   "Emmalouu Pimentel",
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 Text(
//                   "Doctor",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                 ),
//               ],
//             ),
//           )
//         ],
//       );
//   _buildSchedule() => Container(
//         height: 50.0,
//         width: 50.0,
//         color: Colors.orange,
//       );
// }

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';
import 'package:rapha/screens/main_menu_screen.dart';

import '../providers/doctor_provider.dart';
import '../providers/appointment_provider.dart';

import '../preferences/appointment_preferences.dart';

import '../models/doctor.dart';
import '../models/schedule.dart';

import '../widgets/dialogs.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({
    Key? key,
    required this.doctor,
    required this.referral,
  }) : super(key: key);
  final Doctor doctor;
  final bool referral;

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  final _appointmentPreferences = AppointmentPrefereces();
  String _appointmentId = '';
  List<Schedule> _schedules = [];
  String _slotLimit = '';

  initAppointment() async {
    _appointmentId = await _appointmentPreferences.getAppointmentData();
  }

  initSlots() async {
    _slotLimit = await Provider.of<AppointmentProvider>(context, listen: false)
        .isSlotOpen();
  }

  initSchedules() async {
    _schedules = await Provider.of<DoctorProvider>(context, listen: false)
        .fetchSchedules(widget.doctor.id);
  }

  @override
  void initState() {
    initAppointment();
    initSchedules();
    initSlots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Doctor'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: _size.height * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage(
                  'assets/images/background/hospital.jpg',
                ),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.45), BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
            child: _buildProfile(_size),
          ),
          const SizedBox(
            height: 10.0,
          ),
          _buildPersonalInfo(_size),
        ],
      ),
    );
  }

  _buildProfile(_size) => Column(
        children: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage:
                    Image.network(widget.doctor.profileImageUrl).image,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: _size.width - (_size.width * 0.50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          'Dr. ' +
                              widget.doctor.firstName +
                              ' ' +
                              widget.doctor.middleName +
                              ' ' +
                              widget.doctor.lastName,
                          style: const TextStyle(
                              fontSize: 25.0, color: Colors.white),
                          maxLines: 2,
                          minFontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.doctor.speciliazation,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.blueAccent.shade200),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(),
            ],
          ),
          // const SizedBox(
          //   height: 15.0,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Center(
                    child: TextButton(
                      child: const Text(
                        'View Schedule',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(10)),
                      ),
                      onPressed: () {
                        scheduleListDialog(
                            context, widget.doctor.lastName, _schedules);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      );
  _buildPersonalInfo(size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal Information',
              style: TextStyle(fontSize: 25.0),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address: ' + widget.doctor.address,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Email: ' + widget.doctor.email,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Bio',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    SizedBox(
                      height: size.height * (0.3),
                      child: SingleChildScrollView(
                        child: Text(
                          widget.doctor.shortBio,
                        ),
                      ),
                    ),
                    if (widget.referral) ...[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                            child: const Text(
                              'Make an appointment',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            onPressed: () {
                              scheduleDialog(
                                  context,
                                  widget.doctor,
                                  DateTime.parse(_slotLimit),
                                  _schedules,
                                  _appointmentId);
                            },
                          ),
                        ),
                      ),
                    ],
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 35,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          child: const Text(
                            'Back to Home',
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
                ),
              ],
            ),
          ],
        ),
      );
}
