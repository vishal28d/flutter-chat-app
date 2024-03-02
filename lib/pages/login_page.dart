// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_build_context_synchronously, dead_code_catch_following_catch

import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final  emailController = TextEditingController();

  final  passwordController = TextEditingController();

  void login(BuildContext context) async {
    // auth service
    final authService = Provider.of<AuthService>(context, listen: false) ;

    // try login
    try {
      await authService.signInWithEmailandPassword(
          emailController.text, 
          passwordController.text,
          );
    } catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }  
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ),
              );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            SizedBox(height: 30),

            //welcome
            Text(
              "Welcome back..",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            SizedBox(height: 20),

            // email textfield
            MyTextField(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),

            SizedBox(height: 10),

            // paswrd
            MyTextField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),

            SizedBox(height: 10),

            // login button
            MyButton(text: 'Login', onTap: () => login(context)),

            // register now
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? "),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
