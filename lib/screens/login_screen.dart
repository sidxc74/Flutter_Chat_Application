
import 'package:chat_app/extensions/build_context_extension.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/registeration_screen.dart';
import 'package:chat_app/styles/constant_style.dart';
import 'package:chat_app/widgets/customtextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text('Login', style: titleStyle),
           CustomTextField(
            hintText: 'Email',
            isPassword: false,
            icon: Icons.email,
            controller: emailController,
          ),
           CustomTextField(
            hintText: 'Password',
            isPassword: true,
            icon: Icons.password,
            controller: passwordController,
          ),
          ElevatedButton(onPressed: (){
            loginUser();
          }, child: const Text("Login Now")),
          GestureDetector(
            onTap: () {
               context.navigateToScreen(RegistrationScreen(),isReplace: true);
            },
            child: const Text("New User ? Create Account"),
          ),
          
        ],
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
    .then((value){
      context.navigateToScreen(AllChatScreen(),isReplace: true);
    });
  }
}

