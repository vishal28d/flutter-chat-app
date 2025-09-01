// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  void Function()? onTap;
  Color textColor;
  MyButton({super.key, required this.text, required this.onTap, required Color color, required this.textColor, required int height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary ,
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color:  this.textColor,
          ),
        )),
      ),
    );
  }
}
