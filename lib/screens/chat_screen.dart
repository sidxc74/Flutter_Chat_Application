import 'package:chat_app/extensions/build_context_extension.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/styles/constant_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chat Screen", style : titleStyle),
        actions: [
          IconButton(onPressed:(){
             FirebaseAuth.instance.signOut().then((value){
                context.navigateToScreen(LoginScreen(),isReplace: true);
             });
          }, icon: Icon(Icons.logout))
        ],
      ),
      body : Column(
        children: [
          const Spacer(),
          Container(
            width: double.infinity,
            height: 100,
            color : Colors.blue,
            child: TextField(),
          )
        ],
      )
    );
  }
}