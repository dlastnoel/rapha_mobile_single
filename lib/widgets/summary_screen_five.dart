import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapha/routes/routing_constants.dart';

import '../providers/theme_provider.dart';
import '../providers/appointment_provider.dart';

import '../widgets/dialogs.dart';

Widget summaryScreenFive(
    context,
    cardiovascularDetails,
    gastroIntestinalDetails,
    genitourinaryDetails,
    gynecologicDetails,
    endocrineDetails,
    musculoskeletalDetails,
    neuorlogicDetails,
    bool forCreate,
    String status) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          Provider.of<ThemeProvider>(context).summaryFiveBg,
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
          'Childhood Illness',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (cardiovascularDetails['chest_pain']) const Text('• Chest pain'),
        if (cardiovascularDetails['shortness_of_breath'])
          const Text('• Shortness of breath'),
        if (cardiovascularDetails['palpitations']) const Text('• Palpitations'),
        if (cardiovascularDetails['cough']) const Text('• Cough'),
        if (cardiovascularDetails['swelling_of_ankles'])
          const Text('• Swelling of ankles'),
        if (cardiovascularDetails['trouble_lying'])
          const Text('• Trouble in lying'),
        if (cardiovascularDetails['fatigue']) const Text('• Fatigue'),
        if (cardiovascularDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Gastrointestinal Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (gastroIntestinalDetails['changes_in_appetite'])
          const Text('• Changes in appetite'),
        if (gastroIntestinalDetails['nausea']) const Text('• Nausea'),
        if (gastroIntestinalDetails['vomitting']) const Text('• Vomitting'),
        if (gastroIntestinalDetails['diarrhea']) const Text('• Diarrhea'),
        if (gastroIntestinalDetails['constipation'])
          const Text('• Constipation'),
        if (gastroIntestinalDetails['changes_in_bowel'])
          const Text('• Changes in bowel habits'),
        if (gastroIntestinalDetails['bleeding_rectum'])
          const Text('• Bleeding from rectum'),
        if (gastroIntestinalDetails['hemorrhoids']) const Text('• Hemorrhoids'),
        if (gastroIntestinalDetails['decreased_stool'])
          const Text('• Decreased caliber stool'),
        if (gastroIntestinalDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Genitourinary Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (genitourinaryDetails['painful_urination'])
          const Text('• Painful urination'),
        if (genitourinaryDetails['increased_decreased_frequency'])
          const Text('• Increased/Decrease frequency'),
        if (genitourinaryDetails['bloody_urine']) const Text('• Bloody urine'),
        if (genitourinaryDetails['trouble_urination'])
          const Text('• Trouble urination'),
        if (genitourinaryDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Gynecologic Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (gynecologicDetails['pregnancies'] != '' &&
            gynecologicDetails['pregnancies'].toString().isNotEmpty)
          Text('• Number of pregnancies: ' + gynecologicDetails['pregnancies']),
        if (gynecologicDetails['miscarriages'] != '' &&
            gynecologicDetails['miscarriages'].toString().isNotEmpty)
          Text('• Miscarriages: ' + gynecologicDetails['miscarriages']),
        if (gynecologicDetails['last_period'] != '' &&
            gynecologicDetails['last_period'].toString().isNotEmpty)
          Text('• Last period: ' + gynecologicDetails['last_period']),
        const SizedBox(
          height: 5,
        ),
        if (gynecologicDetails['irregular_menstration'] ||
            gynecologicDetails['vaginal_bleeding'] ||
            gynecologicDetails['vaginal_discharge'] ||
            gynecologicDetails['cessation_of_periods'] ||
            gynecologicDetails['hot_flashes'] ||
            gynecologicDetails['vaginal_itching'] ||
            gynecologicDetails['sexual_dysfunction'])
          const Text(
            'Gynecologic Problems',
          ),
        if (gynecologicDetails['irregular_menstration'])
          const Text('• Irregular menstration'),
        if (gynecologicDetails['vaginal_bleeding'])
          const Text('• Vaginal bleeding'),
        if (gynecologicDetails['vaginal_discharge'])
          const Text('• Vaginal discharge'),
        if (gynecologicDetails['cessation_of_periods'])
          const Text('• Cessation of periods'),
        if (gynecologicDetails['hot_flashes']) const Text('• Hot flashes'),
        if (gynecologicDetails['vaginal_itching'])
          const Text('Vaginal itching'),
        if (gynecologicDetails['sexual_dysfunction'])
          const Text('Sexual dysfunction'),
        if (gynecologicDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Endocrine Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (endocrineDetails['hot_or_cold'])
          const Text('• Feeling hot or cold'),
        if (endocrineDetails['fatigue']) const Text('• Fatigue'),
        if (endocrineDetails['changes_hair_skin'])
          const Text('• Changes in hair or skin'),
        if (endocrineDetails['shaking']) const Text('• Shaking'),
        if (endocrineDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Musculoskeletal Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (musculoskeletalDetails['joints_muscle_pain'])
          const Text('• Joint or muscle pain'),
        if (musculoskeletalDetails['stiffness']) const Text('• Stiffness'),
        if (musculoskeletalDetails['motion_limitation'])
          const Text('• Motion limitation'),
        if (musculoskeletalDetails['muscle_atrophy'])
          const Text('• Muscle atrophy'),
        if (musculoskeletalDetails['muscle_hypertrophy'])
          const Text('• Muscle hypertrophy'),
        if (musculoskeletalDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Neurologic Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (neuorlogicDetails['numbness']) const Text('• Numbness'),
        if (neuorlogicDetails['weakness']) const Text('• Weakness'),
        if (neuorlogicDetails['needle_sensation'])
          const Text('• Needle sensation'),
        if (neuorlogicDetails['changes_in_mood'])
          const Text('• Changes in mood'),
        if (neuorlogicDetails['changes_in_memory'])
          const Text('• Changes in memory'),
        if (neuorlogicDetails['tremors']) const Text('• Tremors'),
        if (neuorlogicDetails['seizures']) const Text('• Seizures'),
        if (neuorlogicDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        if (forCreate) ...[
          Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: TextButton(
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    ),
                  ),
                  onPressed: () {
                    privacyPolicy(context, loadingSubmissionScreenRoute);
                  },
                )),
          ),
        ],
        if (!forCreate) ...[
          if (status == 'for_appointment') ...[
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: TextButton(
                  child: const Text(
                    'Make an appointment',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(10)),
                  ),
                  onPressed: () {
                    privacyPolicy(context, 'doctorsListScreenRoute');
                  },
                ),
              ),
            ),
          ],
        ]
      ],
    ),
  );
}
