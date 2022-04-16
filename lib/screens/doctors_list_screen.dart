import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapha/models/schedule.dart';

import '../providers/theme_provider.dart';
import '../providers/doctor_provider.dart';

import '../preferences/doctor_preferences.dart';

import '../models/doctor.dart';

import '../screens/doctor_screen.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({Key? key, required this.referral}) : super(key: key);
  final bool referral;

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  List<Doctor> _doctors = [];

  initDoctors() async {
    _doctors = await Provider.of<DoctorProvider>(context, listen: false)
        .fetchDoctors();
  }

  @override
  void initState() {
    initDoctors();
    super.initState();
  }

//   @override
//   Widget build(BuildContext context) {
//     final _doctorPreferences = DoctorPreferences();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Doctors List'),
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
//             // margin: const EdgeInsets.all(10),
//             // margin: const EdgeInsets.only(top: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // const SizedBox(
//                 //   height: 10,
//                 // ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                     itemBuilder: (context, index) {
//                       return SizedBox(
//                         height: 230,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: 15,
//                               child: Material(
//                                 child: Container(
//                                   height: 180,
//                                   width: MediaQuery.of(context).size.width,
//                                   decoration: BoxDecoration(
//                                     color: Provider.of<ThemeProvider>(context)
//                                         .doctorTile,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               left: 15,
//                               top: 55,
//                               child: CircleAvatar(
//                                   radius: 50.0,
//                                   backgroundImage: Image.network(
//                                           _doctors[index].profileImageUrl)
//                                       .image),
//                             ),
//                             Positioned(
//                               child: SizedBox(
//                                 height: 250,
//                                 child: Container(
//                                   margin:
//                                       const EdgeInsets.only(top: 50, left: 100),
//                                   child: Column(
//                                     children: [
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           'Dr. ' +
//                                               _doctors[index].firstName +
//                                               ' ' +
//                                               _doctors[index].middleName +
//                                               ' ' +
//                                               _doctors[index].lastName,
//                                           style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           _doctors[index]
//                                               .speciliazation
//                                               .toUpperCase(),
//                                           style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 20,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         'Contact: ' + _doctors[index].contact,
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       // const SizedBox(
//                                       //   height: 10,
//                                       // ),
//                                       // Text(
//                                       //   'Schedule: ' + _doctors[index].schedule,
//                                       //   style: const TextStyle(
//                                       //     color: Colors.white,
//                                       //   ),
//                                       // ),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       TextButton(
//                                         onPressed: () {
//                                           _doctorPreferences
//                                               .setDoctor(_doctors[index].id);
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   DoctorScreen(
//                                                       doctor: _doctors[index],
//                                                       referral: true),
//                                             ),
//                                           );
//                                         },
//                                         child: Container(
//                                           padding: const EdgeInsets.all(5),
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           margin:
//                                               const EdgeInsets.only(bottom: 7),
//                                           child: const Text(
//                                             'View',
//                                             style: TextStyle(
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     itemCount: _doctors.length,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    final _doctorPreferences = DoctorPreferences();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctors List'),
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
          // margin: const EdgeInsets.all(10),
          // margin: const EdgeInsets.only(top: 20),
          child: Container(
            margin: const EdgeInsets.only(bottom: 40),
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 180,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).doctorTile,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              Image.network(_doctors[index].profileImageUrl)
                                  .image),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Dr. ' +
                                    _doctors[index].firstName +
                                    ' ' +
                                    _doctors[index].middleName +
                                    ' ' +
                                    _doctors[index].lastName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                _doctors[index].speciliazation.toUpperCase(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Contact: ' + _doctors[index].contact,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   'Schedule: ' + _doctors[index].schedule,
                            //   style: const TextStyle(
                            //     color: Colors.white,
                            //   ),
                            // ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                _doctorPreferences
                                    .setDoctor(_doctors[index].id);
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => DoctorScreen(
                                //         doctor: _doctors[index],
                                //         referral: widget.referral),
                                //   ),
                                // );
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DoctorScreen(
                                          doctor: _doctors[index],
                                          referral: widget.referral),
                                    ),
                                    (route) => false);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: const EdgeInsets.only(bottom: 7),
                                child: const Text(
                                  'View',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                // return SizedBox(
                //   height: 230,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         top: 15,
                //         child: Material(
                //           child: Container(
                //             height: 180,
                //             width: MediaQuery.of(context).size.width,
                //             decoration: BoxDecoration(
                //               color: Provider.of<ThemeProvider>(context)
                //                   .doctorTile,
                //             ),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         left: 15,
                //         top: 55,
                //         child: CircleAvatar(
                //             radius: 50.0,
                //             backgroundImage: Image.network(
                //                     _doctors[index].profileImageUrl)
                //                 .image),
                //       ),
                //       Positioned(
                //         child: SizedBox(
                //           height: 250,
                //           child: Container(
                //             margin:
                //                 const EdgeInsets.only(top: 50, left: 100),
                //             child: Column(
                //               children: [
                //                 Align(
                //                   alignment: Alignment.center,
                //                   child: Text(
                //                     'Dr. ' +
                //                         _doctors[index].firstName +
                //                         ' ' +
                //                         _doctors[index].middleName +
                //                         ' ' +
                //                         _doctors[index].lastName,
                //                     style: const TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 20,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                 ),
                //                 Align(
                //                   alignment: Alignment.center,
                //                   child: Text(
                //                     _doctors[index]
                //                         .speciliazation
                //                         .toUpperCase(),
                //                     style: const TextStyle(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 20,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                 ),
                //                 const SizedBox(
                //                   height: 10,
                //                 ),
                //                 Text(
                //                   'Contact: ' + _doctors[index].contact,
                //                   style: const TextStyle(
                //                     color: Colors.white,
                //                   ),
                //                 ),
                //                 // const SizedBox(
                //                 //   height: 10,
                //                 // ),
                //                 // Text(
                //                 //   'Schedule: ' + _doctors[index].schedule,
                //                 //   style: const TextStyle(
                //                 //     color: Colors.white,
                //                 //   ),
                //                 // ),
                //                 const SizedBox(
                //                   height: 10,
                //                 ),
                //                 TextButton(
                //                   onPressed: () {
                //                     _doctorPreferences
                //                         .setDoctor(_doctors[index].id);
                //                     Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                         builder: (context) => DoctorScreen(
                //                             doctor: _doctors[index],
                //                             referral: true),
                //                       ),
                //                     );
                //                   },
                //                   child: Container(
                //                     padding: const EdgeInsets.all(5),
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius:
                //                           BorderRadius.circular(10),
                //                     ),
                //                     margin:
                //                         const EdgeInsets.only(bottom: 7),
                //                     child: const Text(
                //                       'View',
                //                       style: TextStyle(
                //                         color: Colors.black,
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              },
              itemCount: _doctors.length,
            ),
          ),
        ),
      ),
    );
  }
}

// Container(
//                                   height: 200,
//                                   width: 150,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10.0),
//                                       image: DecorationImage(
//                                           image: Image.network(_doctors[index]
//                                                   .profileImageUrl)
//                                               .image,
//                                           fit: BoxFit.fill)),
//                                 ),