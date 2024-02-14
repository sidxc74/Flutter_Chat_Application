import 'package:chat_app/styles/constant_style.dart';
import 'package:chat_app/widgets/customtextfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Login', style: titleStyle ,),
          CustomTextField(hintText : 'Email', isPassword : false, icon : Icons.email),
          CustomTextField(hintText : 'Password', isPassword : true, icon : Icons.password),
          
        ],)
    );
  }
}

