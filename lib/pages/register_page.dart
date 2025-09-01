// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfPswrdController = TextEditingController();

  void signUp() async {
    if (cnfPswrdController.text != passwordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match ❌")),
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // WhatsApp style green gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade700, Colors.green.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App logo / illustration
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Text('Sign Up',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          )),
                    ),

                    SizedBox(height: 20),

                    // Welcome text
                    Text(
                      "Create Account 🎉",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Sign up to get started",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 30),

                    // Email textfield
                    MyTextField(
                      hintText: 'Email',
                      obscureText: false,
                      controller: emailController,
                    ),

                    SizedBox(height: 16),

                    // Password textfield
                    MyTextField(
                      hintText: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),

                    SizedBox(height: 16),

                    // Confirm password textfield
                    MyTextField(
                      hintText: 'Confirm Password',
                      obscureText: true,
                      controller: cnfPswrdController,
                    ),

                    SizedBox(height: 25),

                    // Register button
                    MyButton(
                      text: 'Register',
                      onTap: signUp,
                      color: Colors.green.shade600,
                      textColor: Colors.white,
                      height: 50,
                    ),

                    SizedBox(height: 20),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                            child: Divider(color: Colors.grey.shade400)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("OR",
                              style: TextStyle(color: Colors.grey)),
                        ),
                        Expanded(
                            child: Divider(color: Colors.grey.shade400)),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Google Sign-up button
                    OutlinedButton.icon(
                      onPressed: () {},
                
                      label: Text(
                        "Sign up with Google",
                        style: TextStyle(color: Colors.black87),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.grey.shade400),
                        backgroundColor: Colors.white,
                      ),
                    ),

                    SizedBox(height: 25),

                    // Already a member? Login option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already a member? ",
                            style: TextStyle(color: Colors.grey.shade700)),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Login now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
