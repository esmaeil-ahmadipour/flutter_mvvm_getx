import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/utils/constants/main_values.dart';

abstract class MainThemes {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: MainValues.fontMedium,
    appBarTheme: const AppBarTheme(
      color: Color(0xFF8BC34A),
    ),
    primarySwatch: Colors.lightGreen,
    primaryColor: const Color(0xFF8BC34A),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xff045041),
      ),
      brightness: Brightness.dark,
      // ),
      primaryColor: const Color(0xff045041));

  // Costume Colors
  static get colorLogo => const Color(0xff007ec5);
}
