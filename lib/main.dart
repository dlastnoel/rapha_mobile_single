import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/doctor_provider.dart';
import 'providers/patient_provider.dart';
import 'providers/splashcontent_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/client_provider.dart';
import 'providers/medical_provider.dart';
import 'providers/appointment_provider.dart';

import 'preferences/client_preferences.dart';
import 'preferences/first_run_preferences.dart';

import 'routes/router.dart' as router;

import 'screens/login_screen.dart';
import 'screens/main_menu_screen.dart';
import 'screens/splashcontent_screen.dart';

void main() {
  // Widget flutter bindings used to interact with the Flutter engine
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => SplashContentProvider()),
        ChangeNotifierProvider(create: (ctx) => ThemeProvider()),
        ChangeNotifierProvider(create: (ctx) => ClientProvider()),
        ChangeNotifierProvider(create: (ctx) => PatientProvider()),
        ChangeNotifierProvider(create: (ctx) => MedicalProvider()),
        ChangeNotifierProvider(create: (ctx) => DoctorProvider()),
        ChangeNotifierProvider(create: (ctx) => AppointmentProvider()),
      ],
      child: const Rapha(),
    ),
  );
}

class Rapha extends StatefulWidget {
  const Rapha({Key? key}) : super(key: key);

  @override
  State<Rapha> createState() => _RaphaState();
}

class _RaphaState extends State<Rapha> {
  // initial first run = true
  bool _isFirstRun = true;
  final ClientPreferences _clientPreferences = ClientPreferences();
  final FirstRunPreferences _firstRunPreferences = FirstRunPreferences();
  bool _isTokenValid = true;

  initializeFirstRun() async {
    _isTokenValid = await _clientPreferences.isTokenValid();
    _isFirstRun = await _firstRunPreferences.getFirstRun();
  }

  @override
  void initState() {
    initializeFirstRun();
    // disable onboarding screen if not first run
    if (_isFirstRun) {
      _firstRunPreferences.disableFirstRun();
    }
    super.initState();
  }

  Widget returnWidget() {
    // show onboarding screen if first run
    if (_isFirstRun) {
      return const SplashContentScreen();
    } else {
      // check if login token is valid
      if (_isTokenValid == false) {
        // show login screen
        return const LoginScreen();
      } else if (_isTokenValid == true) {
        // show main menu screen
        return const MainMenuScreen(
          hasConnection: false,
        );
      }
    }
    return const SplashContentScreen();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rapha',
      themeMode: themeProvider.theme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: router.generateRoute,
      home: returnWidget(),
    );
  }
}
