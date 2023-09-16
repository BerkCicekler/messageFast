import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.secondary, ), borderRadius:BorderRadius.circular(10))
    );
  }
}