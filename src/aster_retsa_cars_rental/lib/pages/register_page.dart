import 'package:aster_retsa_cars_rental/pages/home_page.dart';
import 'package:aster_retsa_cars_rental/pages/splash_screen.dart';
import 'package:aster_retsa_cars_rental/pages/test_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_page_widget/button_front_widget.dart';
import '../widgets/auth_page_widget/custom_field_widget.dart';
import '../widgets/auth_page_widget/google_signup_widget.dart';
import '../widgets/auth_page_widget/upper_logo_widget.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  void registerUser(BuildContext context) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    }
  }
  void _handleGoogleSignIn(){
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
  @override
  void initState(){
    super.initState();
    _auth.authStateChanges().listen((event){
      setState(() {
        _user = event;
      });
    });
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
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: ButtonFront(
                  onTap: () => registerUser(context), 
                  theText: 'Register',
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
                      'Already have an account?',
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
                      theText: 'Login', 
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      groundColor: const Color.fromARGB(255, 34, 37, 37), 
                      textColor: Colors.white
                    ),
                    const SizedBox(height: 10),
                    GoogleSignUp(
                      onPressed: _handleGoogleSignIn,
                    ),
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
