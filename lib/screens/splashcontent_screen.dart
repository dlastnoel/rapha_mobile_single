import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

import '../providers/splashcontent_provider.dart';
import '../routes/routing_constants.dart';

class SplashContentScreen extends StatelessWidget {
  const SplashContentScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashes = Provider.of<SplashContentProvider>(context);
    final splash = splashes.items;
    return CurvedSplashScreen(
      screensLength: splash.length,
      screenBuilder: (index) => SplashContent(
          title: splash[index].title,
          text: splash[index].text,
          image: splash[index].image),
      onSkipButton: () async {
        Navigator.popAndPushNamed(context, loginScreenRoute);
        // bool response = await ClientPreferences().isTokenValid();
        // if (response) {
        //   Navigator.popAndPushNamed(context, loginScreenRoute);
        // } else {
        //   Navigator.popAndPushNamed(context, mainMenuScreenRoute);
        // }
      },
    );
  }
}

class SplashContent extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const SplashContent({
    Key? key,
    required this.title,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Lottie.asset(image),
          ),
          const SizedBox(height: 60),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 19,
            ),
          )
        ],
      ),
    );
  }
}
