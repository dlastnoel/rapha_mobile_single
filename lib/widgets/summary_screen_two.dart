import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

Widget summaryScreenTwo(context, childhoodIllnessDetails, adultIllnessDetails,
    historyOfImmunizationDetails) {
  return Container(
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          Provider.of<ThemeProvider>(context).summaryTwoBg,
        ),
        fit: BoxFit.fitHeight,
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
        if (childhoodIllnessDetails['measles']) const Text('• Measles'),
        if (childhoodIllnessDetails['mumps']) const Text('• Mumps'),
        if (childhoodIllnessDetails['rubella']) const Text('• Rubella'),
        if (childhoodIllnessDetails['asthma']) const Text('• Asthma'),
        if (childhoodIllnessDetails['primary_complex'])
          const Text('• Primary Complex/TB'),
        if (childhoodIllnessDetails['chicken_pox']) const Text('• Chicken Pox'),
        if (childhoodIllnessDetails['others'] != '')
          Text('Others: ' + childhoodIllnessDetails['others'].toString()),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Adult Illness',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (adultIllnessDetails['diabetes']) const Text('• Diabetes'),
        if (adultIllnessDetails['hypertension']) const Text('• Hypertension'),
        if (adultIllnessDetails['stroke']) const Text('• Stroke'),
        if (adultIllnessDetails['arthritis']) const Text('• Arthritis'),
        if (adultIllnessDetails['tuberculosis']) const Text('• Tuberculosis'),
        if (adultIllnessDetails['heart_disease']) const Text('• Heart Disease'),
        if (adultIllnessDetails['thyroid']) const Text('• Thyroid'),
        if (adultIllnessDetails['asthma']) const Text('• Asthma'),
        if (adultIllnessDetails['others'] != '')
          Text('Others: ' + adultIllnessDetails['others'].toString()),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Surgeries, Hospitalizations & Immunization',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (historyOfImmunizationDetails['surgeries'] != '')
          Text('Past surgeries/hospitalizations: ' +
              historyOfImmunizationDetails['surgeries']),
        if (historyOfImmunizationDetails['medical_allergies'] != '')
          Text('Medical allergies: ' +
              historyOfImmunizationDetails['medical_allergies']),
        if (historyOfImmunizationDetails['other_allergies'] != '')
          Text('Other allergies: ' +
              historyOfImmunizationDetails['other_allergies']),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'History of Immunization',
        ),
        if (historyOfImmunizationDetails['hepatitis_a'])
          const Text('• Hepatitis A'),
        if (historyOfImmunizationDetails['hepatitis_b'])
          const Text('• Hepatitis B'),
        if (historyOfImmunizationDetails['polio']) const Text('• Polio'),
        if (historyOfImmunizationDetails['measles']) const Text('• Measles'),
        if (historyOfImmunizationDetails['influenza'])
          const Text('• Influenza'),
        if (historyOfImmunizationDetails['varicella'])
          const Text('• Varicella'),
        if (historyOfImmunizationDetails['influenza_b'])
          const Text('• Influenza B'),
        if (historyOfImmunizationDetails['pneumococcal'])
          const Text('• Pneumococcal'),
        if (historyOfImmunizationDetails['meningococcal'])
          const Text('• Meningococcal'),
        if (historyOfImmunizationDetails['hpv']) const Text('• Hpv'),
        if (historyOfImmunizationDetails['others_immunization'] != '')
          Text(
              'Others: ' + historyOfImmunizationDetails['others_immunization']),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Screening Tests',
        ),
        if (historyOfImmunizationDetails['tuberculosis_test'])
          const Text('• Tuberculosis Test'),
        if (historyOfImmunizationDetails['stool_test'])
          const Text('• Stool Test'),
        if (historyOfImmunizationDetails['colonoscopy'])
          const Text('• Colonoscopy'),
        if (historyOfImmunizationDetails['blood_test'])
          const Text('• Blood Test'),
        if (historyOfImmunizationDetails['x_ray']) const Text('• X-ray'),
        if (historyOfImmunizationDetails['ct_scan_ultrasound'])
          const Text('• CT-Scan/Ultrasoud'),
        if (historyOfImmunizationDetails['pap_smears'])
          const Text('• Pap Smears (Females)'),
        if (historyOfImmunizationDetails['mammograms'])
          const Text('• Mammograms (Females'),
        if (historyOfImmunizationDetails['others_test'] != '')
          Text('Others: ' + historyOfImmunizationDetails['others_test']),
      ],
    ),
  );
}
