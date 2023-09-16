import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCupertinoListTile extends StatelessWidget {
  final String label;
  final IconData leadingIcon, trailingIcon;
  final Function? onTap;
  final Color? color;
  const CustomCupertinoListTile(
      {super.key,
      required this.label,
      required this.leadingIcon,
      required this.trailingIcon,
      this.onTap, 
      this.color});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
        title: Text(
          label,
          style: TextStyle(color: color ?? Theme.of(context).colorScheme.onPrimary),
        ),
        leading: Icon(
          leadingIcon,
          color: color ?? Theme.of(context).colorScheme.onPrimary,
        ),
        trailing: Icon(trailingIcon),
        onTap: () => onTap != null ? onTap!() : null 
      );
  }
}
