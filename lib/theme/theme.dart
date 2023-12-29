import 'package:flutter/material.dart';

// Light mode

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800,
  )
);

// dark mode


ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Color.fromARGB(255, 0, 0, 0),
      primary: Color.fromARGB(255, 24, 24, 24),
      secondary:  Color.fromARGB(134, 52, 52, 52),
      inversePrimary: Colors.grey.shade300,
    )
);