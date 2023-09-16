import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, contextText, actionText;
  const CustomAlertDialog({super.key, required this.title, required this.contextText, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(contextText),
      actions: [
        CupertinoDialogAction(child: Text(actionText, style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)), onPressed: () => Navigator.pop(context),)
      ],
    );
  }
}