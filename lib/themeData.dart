import 'package:flutter/material.dart';

class themeData {
  static Color blackColor = Color(0xff242424);
  static Color primarylight = Color(0xffB7935F);
  static Color primaryBlack = Color(0xff141A2E);
  static Color yellow = Color(0xffFACC1D);

  static ThemeData lightmode = ThemeData(
      primaryColor: primarylight,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: blackColor,
        backgroundColor: Color(0xffB7935F),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      )));
}
