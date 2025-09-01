// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables,
// must_be_immutable, use_build_context_synchronously

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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(e.toString(),
              style: const TextStyle(color: Colors.white)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // gradient background for premium feel
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // App logo
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.green.shade100,
                      child: Icon(
                        Icons.chat_bubble_rounded,
                        size: 50,
                        color: Colors.green.shade700,
                      ),
                    ),

                    SizedBox(height: 20),

                    // Welcome text
                    Text(
                      "Welcome Back 👋",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Login to continue chatting",
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

                    SizedBox(height: 25),

                    // Login button (bold style)
                    MyButton(
                      text: 'Log In',
                      onTap: () => login(context),
                      color: Colors.green.shade600,
                      textColor: Colors.white,
                      height: 40,
                    ),

                    SizedBox(height: 20),

                    // Divider
                    Row(
                      children: [
                        Expanded(
                            child: Divider(color: Colors.grey.shade400, thickness: 1)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "OR",
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Expanded(
                            child: Divider(color: Colors.grey.shade400, thickness: 1)),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Google login button
                    // OutlinedButton.icon(
                    //   onPressed: () {},
                    //   icon: Image.asset("assets/google.png", height: 20),
                    //   label: Text(
                    //     "Continue with Google",
                    //     style: TextStyle(
                    //       color: Colors.black87,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ),
                    //   style: OutlinedButton.styleFrom(
                    //     padding:
                    //         EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //     side: BorderSide(color: Colors.grey.shade400),
                    //     backgroundColor: Colors.grey.shade50,
                    //   ),
                    // ),

                    SizedBox(height: 25),

                    // Register option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not a member? ",
                            style: TextStyle(color: Colors.grey.shade700)),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Register now",
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
