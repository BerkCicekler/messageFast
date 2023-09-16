import "package:flutter/material.dart";

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey[50]!,
      primary: Color.fromRGBO(243, 248, 255, 1),
      secondary: Color.fromRGBO(203, 208, 205, 1),
      onPrimary: Colors.black,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black)

);