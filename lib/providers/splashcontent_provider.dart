import 'package:flutter/material.dart';
import '../models/splash.dart';

class SplashContentProvider with ChangeNotifier {
  final List<Splash> _items = [
    Splash(
        id: '1',
        title: 'Sign Up',
        text: 'Create your account and start using Rapha.',
        image: 'assets/json/lottie/signup.json'),
    Splash(
        id: '2',
        title: 'Upload',
        text: 'Fill up the medical history sheet and manage your data.',
        image: 'assets/json/lottie/upload.json'),
    Splash(
        id: '3',
        title: 'Anytime Anywhere',
        text:
            'Get referred to a specialized doctor whenever and wherever your are.',
        image: 'assets/json/lottie/anytime.json'),
  ];

  List<Splash> get items {
    return [..._items];
  }
}
