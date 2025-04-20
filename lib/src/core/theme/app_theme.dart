import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xfff4fbf8),
    primaryColor: const Color(0xff006a60),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006a60),
      onPrimary: Colors.white,
      secondary: Color(0xff6a847f),
      onSecondary: Colors.white,
      error: Color(0xffba1a1a),
      onError: Colors.white,
      surface: Color(0xfff4fbf8),
      onSurface: Color(0xff161d1c),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff161d1c)),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff161d1c)),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff161d1c)),
    ),
    fontFamily: 'Segoe UI',
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xff121212),
    primaryColor: const Color(0xff006a60),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff006a60),
      onPrimary: Colors.black,
      secondary: Color(0xff6a847f),
      onSecondary: Colors.black,
      error: Color(0xffba1a1a),
      onError: Colors.black,
      surface: Color(0xff1e1e1e),
      onSurface: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
    ),
    fontFamily: 'Segoe UI',
  );
}
