// ignore_for_file: prefer_const_literals_to_create_immutables, must_be_immutable, prefer_const_constructors




import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
   void Function()? onTap ;

   RegisterPage({super.key, required  this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final  emailController = TextEditingController();

  final  passwordController = TextEditingController();

  final  cnfPswrdController = TextEditingController();


   void signUp() async{
    
    if(cnfPswrdController.text != passwordController.text){
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text("Password do not match..")));
      return ;
    }

    // get auth Service 
    final authService = Provider.of<AuthService>(context, listen: false) ;
    try{
      await authService.signUpWithEmailandPassword(emailController.text, passwordController.text);
    } catch(e){
  
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }

   }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            // Icon(
            //   Icons.message,
            //   size: 60,
            //   color: Theme.of(context).colorScheme.primary,
            // ),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/signup.png' ,
                height: 200,
                fit: BoxFit.cover,  
              ),
            ) ,

            SizedBox(height: 10),

            //welcome
            Text(
              "Let's create an account for you",
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
            // confirm password
            MyTextField(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: cnfPswrdController,
            ),

   
            SizedBox(height: 10),

            // login button
            MyButton(text: 'Register', onTap: signUp ),

            // register now
  
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Already a member? "),
                
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
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