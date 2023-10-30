import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:src/about/about.dart';
import 'package:src/home_page/widgets/app_bar_widget.dart';
import 'package:src/home_page/widgets/bottom_navigation_widget.dart';
import 'package:src/pages/confirm_page.dart';
import 'package:src/profile/profile.dart';
import 'package:src/splash_screen/splash_screen.dart';
import 'home_page/home_page.dart';
=======
import 'package:src/pages/login_page.dart';
>>>>>>> 552f458149ae57ca20d1c128eb6ccba1048a64ac
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
    return MaterialApp(
      title: 'Aster Retsa Car Rental',
<<<<<<< HEAD
      home: HomePage(),
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
=======
      home: const HomePage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          background: Colors.white,
        ),
        // useMaterial3: true,
      ),
>>>>>>> 552f458149ae57ca20d1c128eb6ccba1048a64ac
    );
  }
}
