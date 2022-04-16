import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../preferences/medical_preferences.dart';

import '../providers/theme_provider.dart';

import '../routes/routing_constants.dart';

class PresentIllnessImageSummaryScreen extends StatefulWidget {
  const PresentIllnessImageSummaryScreen({Key? key}) : super(key: key);

  @override
  State<PresentIllnessImageSummaryScreen> createState() =>
      _PresentIllnessImageSummaryScreenState();
}

class _PresentIllnessImageSummaryScreenState
    extends State<PresentIllnessImageSummaryScreen> {
  final _medicalPreferences = MedicalPreferences();
  String _presentIllnessImageString = '';

  Future<String> getImageString() async {
    _presentIllnessImageString =
        await _medicalPreferences.getPresentIllnessImage();
    return _presentIllnessImageString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary Results'),
      ),
      body: FutureBuilder<String>(
        future: getImageString(),
        builder: (context, snapshot) {
          String imageString = '';
          if (snapshot.hasData) {
            imageString = snapshot.data!;
          }
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.memory(
                              Uint8List.fromList(imageString.codeUnits))
                          .image,
                      fit: BoxFit.cover,
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
                    onPressed: () {
                      Navigator.pushNamed(context, summaryScreenRoute);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
