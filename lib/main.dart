import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const ChatApp());

}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home : FirebaseAuth.instance.currentUser != null ?
        ChatScreen() : LoginScreen(),
    );
  }
}

