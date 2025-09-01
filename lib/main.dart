// ignore_for_file: prefer_const_constructors, unused_import, avoid_web_libraries_in_flutter

import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/auth/login_or_register.dart';
import 'package:chat_app/pages/login_page.dart';

import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( 
    ChangeNotifierProvider(create: (context)=> AuthService(),
    child: const MyApp(),
    ),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


@override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     home:  AuthGate(),
     theme: lightTheme,
    );
  }
}

