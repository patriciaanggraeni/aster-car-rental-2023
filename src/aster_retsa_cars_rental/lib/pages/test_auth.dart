import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TestAuth extends StatelessWidget{
  TestAuth({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        actions: [
          IconButton(onPressed: signOut, icon: Icon(Icons.logout))
        ]),
        body: Center(child: Text("Logged in as "+user.email!)),
    );
  }
}