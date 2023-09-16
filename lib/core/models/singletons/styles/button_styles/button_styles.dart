import 'package:flutter/material.dart';

class ButtonStyles {

  static ButtonStyles instance = ButtonStyles._();

  ButtonStyles._();

  final ButtonStyle loginButton = ElevatedButton.styleFrom(
    minimumSize:const Size(100, 60),
    backgroundColor: Colors.blue,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    )

  );

}