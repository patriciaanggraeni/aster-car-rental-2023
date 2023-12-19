import 'package:aster_retsa_cars_rental/pages/home_page.dart';
import 'package:aster_retsa_cars_rental/pages/login_page.dart';
import 'package:aster_retsa_cars_rental/pages/test_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          // user login
          if (snapshot.hasData){
            return HomePage();
          } else {
            return LoginPage();
          }
        }

      ),
    );
  }
}