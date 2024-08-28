import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class appConfigProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
