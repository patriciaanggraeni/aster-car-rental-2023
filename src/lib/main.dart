import 'package:flutter/material.dart';
import 'package:src/splash_screen/splash_screen.dart';
import 'home_page/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String homePageRoute = '/home_page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aster Retsa Car Rental',
      home: const HomePage(),
      // routes: {
      //   homePageRoute: (context) => HomePage(),
      // },
    );
  }
}