import "package:flutter/material.dart";

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
    onPrimary: Colors.white,
  ),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white)
);