import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialogAction extends StatelessWidget {
  final String title, contextText;
  const CustomAlertDialogAction({super.key, required this.title, required this.contextText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(contextText),
      actions: [
        CupertinoDialogAction(child: const Text("Yes"), onPressed: () => Navigator.pop(context, true),),
        CupertinoDialogAction(child: const Text("No"), onPressed: () => Navigator.pop(context, false),)
      ],
    );
  }
}