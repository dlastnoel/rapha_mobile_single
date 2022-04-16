import 'package:flutter/material.dart';

import '../preferences/theme_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;
  ThemePreferences _themePreferences = ThemePreferences();

  getThemePreferences() async {
    _themePreferences = ThemePreferences();
    bool isDark = await _themePreferences.getTheme();
    if (isDark) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  ThemeMode get theme {
    getThemePreferences();
    return _themeMode;
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  String get background {
    if (isDarkMode) {
      return 'assets/images/background/dark_mode.png';
    }
    return 'assets/images/background/light_mode.png';
  }

  String get childBackground {
    if (isDarkMode) {
      return 'assets/images/background/child_dark.png';
    }
    return 'assets/images/background/child_light.png';
  }

  String get humanAnatomy {
    if (isDarkMode) {
      return 'assets/images/content/human_boy_dark.png';
    }
    return 'assets/images/content/human_boy_light.png';
  }

  String get summaryOneBg {
    return 'assets/images/background/summary_one.png';
  }

  String get summaryTwoBg {
    return 'assets/images/background/summary_two.png';
  }

  String get summaryThreeBg {
    return 'assets/images/background/summary_three.png';
  }

  String get summaryFourBg {
    return 'assets/images/background/summary_four.png';
  }

  String get summaryFiveBg {
    return 'assets/images/background/summary_five.png';
  }

  String get appointmentSummaryBg {
    return 'assets/images/background/appointment_summary.png';
  }

  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    _themePreferences.setTheme(isOn);
    notifyListeners();
  }

  String get scrollableChildBackground {
    if (isDarkMode) {
      return 'assets/images/background/scrollable_child_dark.png';
    }
    return 'assets/images/background/scrollable_child_light.png';
  }

  Color get doctorTile {
    if (isDarkMode) {
      return Colors.white.withOpacity(0.3);
    }
    return Colors.lightBlue.withOpacity(0.65);
  }
}

class AppTheme {
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: Colors.blue,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
    ),
    cardTheme: const CardTheme(
      color: Colors.blue,
    ),
  );
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: Colors.blue,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.blue.withOpacity(0.8),
    ),
  );
}
