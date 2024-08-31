import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class appConfigProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appTheme = ThemeMode.light;

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("lang", newLanguage);
  }

  Future<void> getlang() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    String? lang = pre.getString("isDark");
    if (lang != null) {
      appLanguage = lang;
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> getTheme() async {
    final SharedPreferences pre = await SharedPreferences.getInstance();
    bool? isDark = pre.getBool("isDark");
    if (isDark != null) {
      if (isDark) {
        appTheme = ThemeMode.dark;
      } else {
        appTheme = ThemeMode.light;
      }
    }
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isDark", newTheme == ThemeMode.dark);
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }
}
