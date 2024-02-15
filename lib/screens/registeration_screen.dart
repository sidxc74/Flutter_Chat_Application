import 'dart:developer';

import 'package:chat_app/extensions/build_context_extension.dart';
import 'package:chat_app/modal/users.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/styles/constant_style.dart';
import 'package:chat_app/widgets/customtextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Registration', style: titleStyle),
          CustomTextField(
            hintText: 'name',
            isPassword: false,
            icon: Icons.person,
            controller: nameController,
          ),
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
          ElevatedButton(
            onPressed: () {
              registerNewUser(context);
            },
            child: Text("Register Now"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("Already a User, Login instead"),
          )
        ],
      ),
    );
  }

  Future<void> registerNewUser(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        final userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null) {
          log(userCredential.user!.uid);

          addDataToDatabase(uid: userCredential.user!.uid);

          // Clear text controllers after successful registration
          nameController.clear();
          emailController.clear();
          passwordController.clear();
        }
      } catch (error) {
        log('Error during registration: $error');
        // You can show a friendly error message to the user here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed. Please try again.'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> addDataToDatabase({required String uid}) async {
    final user = Users(
      nameController.text,
      emailController.text,
      uid,
      true,
      passwordController.text,
      'say khiiiiraaaaaaaab',
    );

    FirebaseFirestore.instance.collection('users').add(user.toJson()).then(
      (value) {
        log('User created successfully');
        context.navigateToScreen(const ChatScreen(),isReplace : true);
      },
    ).catchError((e) {
      log("Couldn't create user");
    });
  }
}



