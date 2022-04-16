import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/medical_preferences.dart';

class PersonalSocialHistoryScreen extends StatefulWidget {
  const PersonalSocialHistoryScreen({Key? key}) : super(key: key);

  @override
  State<PersonalSocialHistoryScreen> createState() =>
      _PersonalSocialHistoryScreenState();
}

class _PersonalSocialHistoryScreenState
    extends State<PersonalSocialHistoryScreen> {
  final _medicalPreferences = MedicalPreferences();

  final TextEditingController _physicalActivityController =
      TextEditingController();
  final TextEditingController _healthyFoodsController = TextEditingController();
  final TextEditingController _courseYearController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _sticksController = TextEditingController();
  final TextEditingController _yearsSmokingController = TextEditingController();
  final TextEditingController _stopSmokingController = TextEditingController();
  final TextEditingController _bottlesController = TextEditingController();

  String _howOften = '';

  final TextEditingController _drugsController = TextEditingController();
  final TextEditingController _startUsingController = TextEditingController();
  final TextEditingController _howOftenController = TextEditingController();
  final TextEditingController _lastUsageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal and Social History'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Provider.of<ThemeProvider>(context).scrollableChildBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _physicalActivityController,
                  decoration: const InputDecoration(
                    labelText:
                        'Do you have a regular physical activity? (specify)',
                  ),
                ),
                TextFormField(
                  controller: _healthyFoodsController,
                  decoration: const InputDecoration(
                    labelText: 'What healthy foods do you eat?',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'If student:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _courseYearController,
                  decoration: const InputDecoration(
                    labelText: 'Course/Year level',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'If working:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _occupationController,
                  // minLines: 1,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Occupation',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'For smokers:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _sticksController,
                  decoration: const InputDecoration(
                    labelText: 'How many sticks per day?',
                  ),
                ),
                TextFormField(
                  controller: _yearsSmokingController,
                  decoration: const InputDecoration(
                    labelText: 'How many years are you smoking?',
                  ),
                ),
                TextFormField(
                  controller: _stopSmokingController,
                  decoration: const InputDecoration(
                    labelText:
                        'If you are a previous smoker,\nwhen did you stopped smoking?',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'For alcoholic beverage drinker:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _bottlesController,
                  decoration: const InputDecoration(
                    labelText: 'How many bottles, shots per day?',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'How often do you drink?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RadioListTile(
                  value: 'everyday',
                  groupValue: _howOften,
                  title: const Text('Everyday'),
                  onChanged: (String? value) {
                    setState(() {
                      _howOften = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  value: 'most days of the week',
                  groupValue: _howOften,
                  title: const Text('Most days of the week'),
                  onChanged: (String? value) {
                    setState(() {
                      _howOften = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  value: '1-2x per week',
                  groupValue: _howOften,
                  title: const Text('1-2x per week'),
                  onChanged: (String? value) {
                    setState(() {
                      _howOften = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  value: 'every month',
                  groupValue: _howOften,
                  title: const Text('Every month'),
                  onChanged: (String? value) {
                    setState(() {
                      _howOften = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  value: 'occasional',
                  groupValue: _howOften,
                  title: const Text('Occasional'),
                  onChanged: (String? value) {
                    setState(() {
                      _howOften = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Do you have any history of illegal drug use?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _drugsController,
                  decoration: const InputDecoration(
                    labelText: 'What substance are you using?',
                  ),
                ),
                TextFormField(
                  controller: _startUsingController,
                  decoration: const InputDecoration(
                    labelText: 'When did you start using it?',
                  ),
                ),
                TextFormField(
                  controller: _howOftenController,
                  decoration: const InputDecoration(
                    labelText: 'How often do you use it?',
                  ),
                ),
                TextFormField(
                  controller: _lastUsageController,
                  decoration: const InputDecoration(
                    labelText: 'When did the last time you used it?',
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
                      Map<String, dynamic> personalAndSocialHistoryDetails = {
                        'physical_activity': _physicalActivityController.text,
                        'healthy_foods': _healthyFoodsController.text,
                        'course_year_level': _courseYearController.text,
                        'occupation': _occupationController.text,
                        'sticks_per_day': _sticksController.text,
                        'years_smoking': _yearsSmokingController.text,
                        'when_stop_smoking': _stopSmokingController.text,
                        'bottles_per_day': _bottlesController.text,
                        'how_often_drinking': _howOften,
                        'substance_drugs': _drugsController.text,
                        'when_drugs_used': _startUsingController.text,
                        'how_often_drugs': _howOftenController.text,
                        'last_time_drugs': _lastUsageController.text,
                      };
                      _medicalPreferences.setPersonalAndSocialHistory(
                          jsonEncode(personalAndSocialHistoryDetails));
                      // Provider.of<MedicalProvider>(context, listen: false)
                      //     .addPersonalAndSocialHistory();
                      Navigator.pushNamed(
                          context, functionalHistoryScreenRoute);
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
