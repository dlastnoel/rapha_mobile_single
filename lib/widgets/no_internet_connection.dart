import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../providers/theme_provider.dart';

Widget noInternetConnectionWidget(context) {
  return Scaffold(
    body: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Provider.of<ThemeProvider>(context).background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Lottie.asset('assets/json/lottie/no_internet_connection.json'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'No Internet Connection',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
