import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:src/home_page/widgets/app_bar_widget.dart';
import 'package:src/home_page/widgets/bottom_navigation_widget.dart';
import 'package:src/pages/login_page.dart';
import 'package:src/splash_screen/splash_screen.dart';
import 'home_page/home_page.dart';
=======
import 'package:src/pages/about.dart';
import 'package:src/widgets/home_page_widget/app_bar_widget.dart';
import 'package:src/pages/splash_screen.dart';
import 'pages/home_page.dart';
>>>>>>> 9fefecfa63eb76e1d8025c2bb9fbe66801be36f7
import 'package:src/pages/detail_page.dart';
import 'models/car.dart';
import 'package:src/pages/register_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String homePageRoute = '/home_page';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aster Retsa Car Rental',
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
    );
  }
}