import 'package:flutter/material.dart';
import 'package:src/pages/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aster Retsa Car Rental',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(25, 25, 25, 1),
          background: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
