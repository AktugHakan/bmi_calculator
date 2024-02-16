import 'package:flutter/material.dart';

ThemeData defaultTheme(BuildContext context) => ThemeData(
      colorScheme: ColorScheme.dark(
        background: Color(0xFF0a0d22),
        brightness: Brightness.dark,
        primary: Color(0xFF0a0d22),
        secondary: Color(0xffeb1555),
        surface: Color(0xff111328),
      ),
      textTheme: Theme.of(context).textTheme.copyWith(
          bodyMedium: TextStyle(
            color: Colors.white54,
            fontSize: 24,
          ),
          bodyLarge: TextStyle(
              color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900)),
    );
