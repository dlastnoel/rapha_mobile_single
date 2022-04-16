import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget noDataFoundWidget(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: double.infinity,
        child: Lottie.asset('assets/json/lottie/no_data_found.json'),
      ),
      const Text(
        'No data found',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
