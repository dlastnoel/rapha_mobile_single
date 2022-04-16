import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

import '../helpers/capitalize.dart';

Widget summaryScreenOne(
    context, patientDetails, chiefComplaintDetails, presentIllnessDetails) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          Provider.of<ThemeProvider>(context).summaryOneBg,
        ),
        fit: BoxFit.fitHeight,
      ),
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Demographics Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text('• Date of Birth: ' + patientDetails['date_of_birth']),
        Text('• Sex: ' + patientDetails['sex'].toString().capitalize()),
        Text('• Marital Status: ' +
            patientDetails['marital_status'].toString().capitalize()),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Chief Complaint',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (chiefComplaintDetails['cough']) const Text('• Cough'),
        if (chiefComplaintDetails['pain']) const Text('• Pain'),
        if (chiefComplaintDetails['weakness']) const Text('• Weakness'),
        if (chiefComplaintDetails['decrease_sensation'])
          const Text('• Decrease sensation'),
        if (chiefComplaintDetails['rashes']) const Text('• Rashes'),
        if (chiefComplaintDetails['trouble_breathing'])
          const Text('• Trouble breathing'),
        if (chiefComplaintDetails['vomitting']) const Text('• Vomitting'),
        if (chiefComplaintDetails['voweling']) const Text('• Voweling'),
        if (chiefComplaintDetails['others'] != null &&
            chiefComplaintDetails['others'].toString().isNotEmpty)
          Text('Others: ' + chiefComplaintDetails['others'].toString()),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Present Illness',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (presentIllnessDetails['symptoms_started'] != null &&
            presentIllnessDetails['symptoms_started'].toString().isNotEmpty)
          Text('• Symptoms started: ' +
              presentIllnessDetails['symptoms_started'].toString()),
        if (presentIllnessDetails['how_often'] != null &&
            presentIllnessDetails['how_often'].toString().isNotEmpty)
          Text('• How often: ' + presentIllnessDetails['how_often'].toString()),
        if (presentIllnessDetails['how_long'] != null &&
            presentIllnessDetails['how_long'].toString().isNotEmpty)
          Text('• How long: ' + presentIllnessDetails['how_long'].toString()),
        if (presentIllnessDetails['describe'] != null &&
            presentIllnessDetails['describe'].toString().isNotEmpty)
          Text(
              '• Description: ' + presentIllnessDetails['describe'].toString()),
        if (presentIllnessDetails['severity'] != null &&
            presentIllnessDetails['severity'].toString().isNotEmpty)
          Text('• Severity: ' + presentIllnessDetails['severity'].toString()),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Does it affect your ambulation, work and recreational activites?',
        ),
        if (presentIllnessDetails['affects_walking'] == false &&
            presentIllnessDetails['affects_bathing'] == false &&
            presentIllnessDetails['affects_dressing'] == false &&
            presentIllnessDetails['affects_eating'] == false &&
            presentIllnessDetails['affects_hygiene'] == false &&
            presentIllnessDetails['affects_sleeping'] == false &&
            presentIllnessDetails['affects_toilet'] == false &&
            presentIllnessDetails['affects_sex'] == false &&
            presentIllnessDetails['affects_bowel'] == false &&
            presentIllnessDetails['affects_urination'] == false)
          const Text('• No'),
        if (presentIllnessDetails['affects_walking'])
          const Text('• On walking'),
        if (presentIllnessDetails['affects_bathing'])
          const Text('• On bathing'),
        if (presentIllnessDetails['affects_dressing'])
          const Text('• On dressing'),
        if (presentIllnessDetails['affects_eating']) const Text('• On eating'),
        if (presentIllnessDetails['affects_hygiene'])
          const Text('• On hygiene/grooming'),
        if (presentIllnessDetails['affects_sleeping'])
          const Text('• On sleeping'),
        if (presentIllnessDetails['affects_toilet']) const Text('• On toilet'),
        if (presentIllnessDetails['affects_sex'])
          const Text('• On sexual activity'),
        if (presentIllnessDetails['affects_bowel'])
          const Text('• On bowel movement'),
        if (presentIllnessDetails['affects_urination'])
          const Text('• On urination'),
        const SizedBox(
          height: 5,
        ),
        if (presentIllnessDetails['activities_worse'] != null &&
            presentIllnessDetails['activities_worse'].toString().isNotEmpty)
          Text('Activities that makes the symptom worse: ' +
              presentIllnessDetails['activities_worse']),
        if (presentIllnessDetails['activities_improves'] != null &&
            presentIllnessDetails['activities_improves'].toString().isNotEmpty)
          Text('• Activities that makes the symptom improve: ' +
              presentIllnessDetails['activities_improves']),
        if (presentIllnessDetails['other_symptoms'] != null &&
            presentIllnessDetails['other_symptoms'].toString().isNotEmpty)
          Text('• Other symptoms: ' + presentIllnessDetails['other_symptoms']),
        if (presentIllnessDetails['medications'] != null &&
            presentIllnessDetails['medications'].toString().isNotEmpty)
          Text('• Current medications taking: ' +
              presentIllnessDetails['medications']),
      ],
    ),
  );
}
