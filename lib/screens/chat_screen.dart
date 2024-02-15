import 'package:chat_app/extensions/build_context_extension.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/styles/constant_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
   const ChatScreen({super.key});

  
 
  @override
  State<ChatScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChatScreen> {

  final messageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Chat Screen", style : titleStyle),
        elevation: 5,
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
            child: Padding(
              padding: const EdgeInsets.only(bottom : 10.0, left : 12.0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: context.getWidth(percentage: .80),
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true
              
                      ),
                    )),
                    IconButton(onPressed: (){
                      sendMessage();
                    }, icon: Icon(Icons.send, color: Colors.white,))
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  Future<void> sendMessage() async {
    
    if(messageController.text.isNotEmpty){

   final message = {
    'message' : messageController.text,
    'senderUid':FirebaseAuth.instance.currentUser!.uid,
    'senderEmail': FirebaseAuth.instance.currentUser!.email,
    'timestamp': DateTime.now().millisecondsSinceEpoch,
   };


    FirebaseFirestore.instance.collection('messages').add(message).then((value){
      messageController.clear();
      
    });
    }
   
  }
}