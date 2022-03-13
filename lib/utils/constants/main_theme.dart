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
  static Color colorLogo = const Color(0xff007ec5);
  static Color colorConfirm = const Color(0xff067d3c);
  static Color lightColorText = const Color(0xffffffff);

  // Text Widget Styled
  static Widget textIranBold(
      {required String string,
        required Color color,
        required double fontSize}) {
    return Text(
      string,
      style: TextStyle(
        fontFamily: MainValues.fontMedium,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.right,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Text Style
  static textStyleIranBold({required Color color, required double fontSize}) {
    return TextStyle(
      fontFamily: MainValues.fontMedium,
      color: color,
      fontSize: fontSize,
    );
  }
}
