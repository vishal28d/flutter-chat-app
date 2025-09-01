// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final IconData? prefixIcon; // optional icon

  MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 18),

          // Rounded border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.green.shade600,
              width: 2,
            ),
          ),

          // Background color
          filled: true,
          fillColor: Colors.grey.shade100,

          // Hint
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 15,
          ),

          // Optional icon
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.green.shade600)
              : null,

          // Slight shadow for depth
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
