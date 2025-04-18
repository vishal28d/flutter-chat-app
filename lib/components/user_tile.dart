// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text ;
  final void Function()? onTap ;


  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child:Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary ,
          borderRadius: BorderRadius.circular(12), 
        ),
        child: Row(children: [
          // icons
          const Icon(Icons.person),
          
          // username
          Text(text) ,

        ],
        ),
      ) ,
    ) ;
  }
}