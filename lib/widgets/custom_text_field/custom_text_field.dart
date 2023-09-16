import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width * 0.95,
      height: _height * 0.09,
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff757575), width: 2),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary), //
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontFamily: "Roboto"),
          border: InputBorder.none,
        ),
        style: TextStyle(
            height: 1.3,
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 15,
            fontFamily: "Roboto"),
      ),
    );
  }
}