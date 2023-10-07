import 'package:flutter/material.dart';

class AppTheme {
  static Color primaryColor = const Color(0xFF2E4259);
  static Color backgroundColor = const Color(0xFF242B39);
  static Color orange = const Color(0xFFED9240);
  static Color whiteish = const Color(0xFFCDDCE6);

  static TextTheme darkText = TextTheme(
      bodySmall: TextStyle(
        color: whiteish,
        fontSize: 12,
      ),
      bodyMedium: TextStyle(
        color: whiteish,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: whiteish,
        fontSize: 18,
      ),
      displaySmall: TextStyle(
        color: whiteish,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: whiteish,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: TextStyle(
        color: whiteish,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ));

  static ElevatedButtonThemeData darkElevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: orange,
    ),
  );
}
