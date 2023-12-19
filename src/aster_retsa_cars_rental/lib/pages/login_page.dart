import 'package:aster_retsa_cars_rental/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_page_widget/button_front_widget.dart';
import '../widgets/auth_page_widget/custom_field_widget.dart';
import '../widgets/auth_page_widget/google_signup_widget.dart';
import '../widgets/auth_page_widget/upper_logo_widget.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(),
      );
    },
  );
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    Navigator.pop(context);
  } on FirebaseAuthException catch (e) {
    Navigator.pop(context);
    if (e.code == 'user-not-found') {
      wrongEmailMessage(context);
    } else if (e.code == 'wrong-password') {
      wrongPassMessage(context);
    }
  }
}

void wrongEmailMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Incorrect Email'),
      );
    },
  );
}

void wrongPassMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Incorrect Password'),
      );
    },
  );
}


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
                      'LOGIN',
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
                child: Column(
                  children: [
                    CustomField(
                      controller: emailController,
                      hintText: 'Email',
                      obsecure: false,
                    ),
                    const SizedBox(height: 10),
                    CustomField(
                      controller: passwordController,
                      hintText: 'Password', 
                      obsecure: true
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // LOGIN BUTTON
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ButtonFront(
                  onTap: () => signUserIn(context),
                  theText: 'Login',
                  textColor: const Color.fromARGB(255, 34, 37, 37),
                  groundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Row(
                  children: [
                    Text(
                      'Dont\'t have any account?',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: Color(0xFFFDFDFD),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      ButtonFront(
                        theText: 'Register', 
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        groundColor: const Color.fromARGB(255, 34, 37, 37), 
                        textColor: Colors.white
                      ),
                      const SizedBox(height: 30),
                      const GoogleSignUp(),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
