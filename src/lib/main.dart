import 'package:flutter/material.dart';
import 'package:src/pages/splash_screen.dart';
import 'package:src/pages/verification_profile_page.dart';

// void main() => runApp(const MyApp());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

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
