// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintText;
  bool obscureText;
  final TextEditingController controller ;

  MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary)),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
