import 'package:flutter/material.dart';
import 'package:src/pages/splash_screen.dart';
import 'package:src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String homePageRoute = '/home_page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aster Retsa Car Rental',
      initialRoute: '/',
      routes: {
        homePageRoute: (context) => const HomePage(),
      },
      home: const SplashScreen(),
    );
  }
}
