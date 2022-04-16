import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

Widget summaryScreenFour(context, generalSystemDetails, skinProblemDetails,
    heentDetails, breastsDetails, pulmonaryDetails) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          Provider.of<ThemeProvider>(context).summaryFourBg,
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
          'General System',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (generalSystemDetails['fever']) const Text('• Fever'),
        if (generalSystemDetails['fatigue']) const Text('• Fatigue'),
        if (generalSystemDetails['weight_change'])
          const Text('• Recent weight change'),
        if (generalSystemDetails['weakness']) const Text('• Weakness'),
        if (generalSystemDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Skin Problems',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (skinProblemDetails['rashes']) const Text('• Rashes'),
        if (skinProblemDetails['lumps']) const Text('• Lumps'),
        if (skinProblemDetails['sores']) const Text('• Sores'),
        if (skinProblemDetails['itching']) const Text('• Itching'),
        if (skinProblemDetails['dryness']) const Text('• Dryness'),
        if (skinProblemDetails['changes_in_color'])
          const Text('• Changes in color'),
        if (skinProblemDetails['changes_in_hair_nails'])
          const Text('• Changes in hair or nails'),
        if (skinProblemDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Head, Eyes, Ears, Nose, Throat (HEENT)',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (heentDetails['headache']) const Text('• Headache'),
        if (heentDetails['dizziness']) const Text('• Dizziness'),
        if (heentDetails['lightheadedness']) const Text('• Lightheadedness'),
        if (heentDetails['changes_in_vision'])
          const Text('• Changes in vision'),
        if (heentDetails['eye_pain']) const Text('• Eye pain'),
        if (heentDetails['eye_redness']) const Text('• Eye redness'),
        if (heentDetails['double_vision']) const Text('• Double vision'),
        if (heentDetails['watery_eyes']) const Text('• Watery eyes'),
        if (heentDetails['poor_hearing']) const Text('• Poor hearing'),
        if (heentDetails['ringing_ears']) const Text('• Ringning ears'),
        if (heentDetails['ear_discharge']) const Text('• Ear discharge'),
        if (heentDetails['stuffy_nose']) const Text('• Nasal bleeding'),
        if (heentDetails['nasal_discharge']) const Text('• Nasal discharge'),
        if (heentDetails['nasal_bleeding']) const Text('• Nasal bleeding'),
        if (heentDetails['unusual_odors']) const Text('• Unusual odors'),
        if (heentDetails['mouth_sores']) const Text('• Mouth sores'),
        if (heentDetails['altered_taste']) const Text('• Altered taste'),
        if (heentDetails['sore_tongue']) const Text('• Sore tongue'),
        if (heentDetails['gum_problem']) const Text('• Gum problem'),
        if (heentDetails['sore_throat']) const Text('• Sore throat'),
        if (heentDetails['hoarseness']) const Text('• Hoarseness'),
        if (heentDetails['swelling']) const Text('• Swelling'),
        if (heentDetails['diffuculty_swallowing'])
          const Text('• Difficulty swallowing'),
        if (heentDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Breasts Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (breastsDetails['breast_lumps']) const Text('• Breast lumps'),
        if (breastsDetails['nipple_discharge'])
          const Text('• Nipple discharge'),
        if (breastsDetails['bleeding']) const Text('• Bleeding'),
        if (breastsDetails['breast_swelling']) const Text('• Breast swelling'),
        if (breastsDetails['breast_tenderness'])
          const Text('• Breast tenderness'),
        if (breastsDetails['none']) const Text('• None'),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Pulmonary Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (pulmonaryDetails['cough']) const Text('• Cough'),
        if (pulmonaryDetails['sputum']) const Text('• Sputum'),
        if (pulmonaryDetails['bloody_sputum']) const Text('• Bloody sputum'),
        if (pulmonaryDetails['chest_pain']) const Text('• Chest pain'),
        if (pulmonaryDetails['shortness_breath'])
          const Text('• Shortness of breath'),
        if (pulmonaryDetails['none']) const Text('• None'),
      ],
    ),
  );
}
