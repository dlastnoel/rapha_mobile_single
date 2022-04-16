import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

import '../helpers/capitalize.dart';

Widget summaryScreenThree(context, familyHistoryDetails,
    personalAndSocialHistoryDetails, functionalHistoryDetails) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          Provider.of<ThemeProvider>(context).summaryThreeBg,
        ),
        fit: BoxFit.cover,
      ),
    ),
    padding: const EdgeInsets.all(15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Family History',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (familyHistoryDetails['diabetes']) const Text('• Diabetes'),
        if (familyHistoryDetails['hypertension']) const Text('• Hypertension'),
        if (familyHistoryDetails['stroke']) const Text('• Stroke'),
        if (familyHistoryDetails['arthritis']) const Text('• Arthritis'),
        if (familyHistoryDetails['tuberculosis']) const Text('• Tuberculosis'),
        if (familyHistoryDetails['heart_disease'])
          const Text('• Heart Disease'),
        if (familyHistoryDetails['thyroid'])
          const Text('• Thyroid or renal disease'),
        if (familyHistoryDetails['asthma']) const Text('• Asthma'),
        if (familyHistoryDetails['others'] != null &&
            familyHistoryDetails['others'].toString().isNotEmpty)
          Text('• Others: ' + familyHistoryDetails['others'].toString()),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Personal and Social History',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (personalAndSocialHistoryDetails['physical_activity'] != null &&
            personalAndSocialHistoryDetails['physical_activity']
                .toString()
                .isNotEmpty)
          Text('• Physical activities: ' +
              personalAndSocialHistoryDetails['physical_activity']),
        if (personalAndSocialHistoryDetails['healthy_foods'] != null &&
            personalAndSocialHistoryDetails['healthy_foods']
                .toString()
                .isNotEmpty)
          Text('• Healthy foods: ' +
              personalAndSocialHistoryDetails['healthy_foods']),
        if (personalAndSocialHistoryDetails['course_year_level'] != null &&
            personalAndSocialHistoryDetails['course_year_level']
                .toString()
                .isNotEmpty)
          Text('• Course/Year Level: ' +
              personalAndSocialHistoryDetails['course_year_level']),
        if (personalAndSocialHistoryDetails['occupation'] != null &&
            personalAndSocialHistoryDetails['occupation'].toString().isNotEmpty)
          Text(
              '• Occupation: ' + personalAndSocialHistoryDetails['occupation']),
        if (personalAndSocialHistoryDetails['sticks_per_day'] != null &&
            personalAndSocialHistoryDetails['sticks_per_day']
                .toString()
                .isNotEmpty)
          Text('• Smoking: Yes, ' +
              personalAndSocialHistoryDetails['sticks_per_day'] +
              ' sticks per day'),
        if (personalAndSocialHistoryDetails['years_smoking'] != null &&
            personalAndSocialHistoryDetails['years_smoking']
                .toString()
                .isNotEmpty)
          Text('• Years smoking: ' +
              personalAndSocialHistoryDetails['years_smoking']),
        if (personalAndSocialHistoryDetails['when_stop_smoking'] != null &&
            personalAndSocialHistoryDetails['when_stop_smoking']
                .toString()
                .isNotEmpty)
          Text('• Stopped smoking: ' +
              personalAndSocialHistoryDetails['when_stop_smoking']),
        if (personalAndSocialHistoryDetails['bottles_per_day'] != null &&
            personalAndSocialHistoryDetails['bottles_per_day']
                .toString()
                .isNotEmpty)
          Text('• Drinking: Yes,' +
              personalAndSocialHistoryDetails['bottles_per_day'] +
              ' bottles per day'),
        if (personalAndSocialHistoryDetails['how_often_drinking'] != null &&
            personalAndSocialHistoryDetails['how_often_drinking']
                .toString()
                .isNotEmpty)
          Text('• How often drinking: ' +
              personalAndSocialHistoryDetails['how_often_drinking']),
        if (personalAndSocialHistoryDetails['substance_drugs'] != null &&
            personalAndSocialHistoryDetails['substance_drugs']
                .toString()
                .isNotEmpty)
          Text(
              '• Drugs: ' + personalAndSocialHistoryDetails['substance_drugs']),
        if (personalAndSocialHistoryDetails['when_drugs_used'] != null &&
            personalAndSocialHistoryDetails['when_drugs_used']
                .toString()
                .isNotEmpty)
          Text('• Started using: ' +
              personalAndSocialHistoryDetails['when_drugs_used']),
        if (personalAndSocialHistoryDetails['how_often_drugs'] != null &&
            personalAndSocialHistoryDetails['how_often_drugs']
                .toString()
                .isNotEmpty)
          Text('• How often: ' +
              personalAndSocialHistoryDetails['how_often_drugs']),
        if (personalAndSocialHistoryDetails['last_time_drugs'] != null &&
            personalAndSocialHistoryDetails['last_time_drugs']
                .toString()
                .isNotEmpty)
          Text('• Last usage: ' +
              personalAndSocialHistoryDetails['last_time_drugs']),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Functional History',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (functionalHistoryDetails['assistive_walking'] != null &&
            functionalHistoryDetails['assistive_walking'].toString().isNotEmpty)
          Text('• Assistive device in walking: ' +
              personalAndSocialHistoryDetails['assistive_walking']
                  .toString()
                  .capitalize()),
        if (functionalHistoryDetails['drive_own'] != null &&
            functionalHistoryDetails['drive_own'].toString().isNotEmpty)
          Text('• Driving: ' +
              personalAndSocialHistoryDetails['drive_own']
                  .toString()
                  .capitalize()),
        const SizedBox(height: 5),
        const Text('Daily living activites that have difficulties with: '),
        if (functionalHistoryDetails['affects_walking'])
          const Text('• Mobility'),
        if (functionalHistoryDetails['affects_bathing'])
          const Text('• Bathing'),
        if (functionalHistoryDetails['affects_dressing'])
          const Text('• Dressing'),
        if (functionalHistoryDetails['affects_eating']) const Text('• Eating'),
        if (functionalHistoryDetails['affects_hygiene'])
          const Text('• Hygiene/Grooming'),
        if (functionalHistoryDetails['affects_sleeping'])
          const Text('• Sleeping'),
        if (functionalHistoryDetails['affects_toilet']) const Text('• Toilet'),
        if (functionalHistoryDetails['affects_sex'])
          const Text('• Sexual Activity'),
        if (functionalHistoryDetails['affects_bowel']) const Text('• Defacate'),
        if (functionalHistoryDetails['affects_urination'])
          const Text('• Urination'),
        if (functionalHistoryDetails['needs_support'] == 'yes')
          const Text(
              '• Needs support in activities having difficulties with: Yes'),
        if (functionalHistoryDetails['assistive_devices'] != null &&
            functionalHistoryDetails['assistive_devices'].toString().isNotEmpty)
          Text('• Assistve devices: ' +
              functionalHistoryDetails['assistive_devices']),
        if (functionalHistoryDetails['difficulties_activities'] != null &&
            functionalHistoryDetails['difficulties_activities']
                .toString()
                .isNotEmpty)
          Text('• Other diffcult activites: ' +
              functionalHistoryDetails['difficulties_activities']),
        if (functionalHistoryDetails['difficulties_assistance'] != null &&
            functionalHistoryDetails['difficulties_assistance']
                .toString()
                .isNotEmpty)
          Text('• Difficulties assistance: ' +
              functionalHistoryDetails['difficulties_assistance']),
        if (functionalHistoryDetails['difficulties_in_complicated'] != null &&
            functionalHistoryDetails['difficulties_in_complicated']
                .toString()
                .isNotEmpty)
          Text('• Difficulties in complicated tasks: ' +
              functionalHistoryDetails['difficulties_in_complicated']),
        if (functionalHistoryDetails['difficulties_in_verbal'] != null &&
            functionalHistoryDetails['difficulties_in_verbal']
                .toString()
                .isNotEmpty)
          Text('• Difficulties in verbal: ' +
              functionalHistoryDetails['difficulties_in_verbal']),
      ],
    ),
  );
}
