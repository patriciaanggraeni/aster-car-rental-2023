import 'package:flutter/material.dart';
import 'package:src/widgets/auth_page_widget/button_front_widget.dart';
import 'package:src/widgets/auth_page_widget/google_signup_widget.dart';
import 'package:src/widgets/auth_page_widget/upper_logo_widget.dart';
import 'package:src/widgets/auth_page_widget/custom_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 37, 37),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const UpperLogo(),
              const SizedBox(
                height: 60,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'REGISTER',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFFDFDFD),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  children: [
                    CustomField(
                      hintText: 'Email',
                      obsecure: false,
                    ),
                    SizedBox(height: 10),
                    CustomField(hintText: 'Password', obsecure: true),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: const ButtonFront(theText: 'Register')),
              const SizedBox(height: 100),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: const GoogleSignUp()),
            ],
          ),
        ),
      ),
    );
  }
}
