import 'package:flutter/material.dart';
import 'package:src/pages/about.dart';
import 'package:src/pages/confirm_page.dart';
import 'package:src/pages/profile.dart';
import 'package:src/pages/login_page.dart';
import 'package:src/pages/detail_page.dart';
import 'models/car.dart';
import 'package:src/pages/register_page.dart';
import 'package:src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String homePageRoute = '/home_page';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aster Retsa Car Rental',

      home: About(),
      //   homePageRoute: (context) => HomePage(),
      // },
      // theme: ThemeData(
      //   fontFamily: 'Poppins',
      //   colorScheme: const ColorScheme.light(
      //     primary: Colors.black,
      //     background: Colors.white,
      //   ),
      //   useMaterial3: true,
      // ),
      // home: DetailPage(car: innovaZenix),

      // home: const HomePage(),
      // theme: ThemeData(
      //   fontFamily: 'Poppins',
      //   colorScheme: const ColorScheme.light(
      //     primary: Colors.black,
      //     background: Colors.white,
      //   ),
      //   // useMaterial3: true,
      // ),
    );
  }
}
