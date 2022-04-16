import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routing_constants.dart';
import '../providers/theme_provider.dart';

import '../preferences/client_preferences.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                ClientPreferences().removeClient();
                Navigator.of(context).pop();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  loginScreenRoute,
                  (route) => false,
                );
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferences'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showDialog(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  Provider.of<ThemeProvider>(context).childBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const ChangeThemeButtonWidget(),
              const Center(
                child: Text(
                  'ABOUT RAPHA',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                child: Row(
                  children: const <Widget>[
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'DEVELOPERS',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'TEAM\nCODE\nSECRET',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Text(
                          'Irish L.\n Ian Justin S.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Text(
                          'Noel Xavier U. \n Isiah Neil V.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: const Text(
                  'What is Rapha?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 3, 15, 15),
                child: const Center(
                  child: Text(
                    'Rapha is a medical history taking application that will help you manage your time, for faster transaction to doctors, to have an accurate and reliable medical data about your situation.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logos/dmmmsu_logo.png',
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logos/rapha_logo_full.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/logos/cit_logo.png',
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SwitchListTile(
      title: const Text(
        'Night Mode',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
