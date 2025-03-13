import 'package:flutter/material.dart';
import 'package:motwakel/core/utils/colors.dart';



class AppTheme {
  static final ThemeData lightTheme = ThemeData(
   /* primaryColor: ColorSelection.purple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorSelection.purple,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),*/
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: ColorSelection.purple,
      unselectedItemColor: ColorSelection.borderColor,
    ),
  );
}
