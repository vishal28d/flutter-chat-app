import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.green.shade700, // titles, accents
    secondary: Colors.grey.shade200, // textfield bg
    tertiary: Colors.grey.shade400, // borders
    surface: Colors.white, // scaffold bg
  ),
  scaffoldBackgroundColor: Colors.green.shade50, // WhatsApp-like bg
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green.shade700,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.green.shade400,
    secondary: Colors.grey.shade900,
    tertiary: Colors.grey.shade700,
    surface: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.black, // Telegram-like dark bg
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade900,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);
