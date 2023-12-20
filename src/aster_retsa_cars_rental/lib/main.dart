import 'package:aster_retsa_cars_rental/firebase_options.dart';
import 'package:aster_retsa_cars_rental/pages/home_page.dart';
import 'package:aster_retsa_cars_rental/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
