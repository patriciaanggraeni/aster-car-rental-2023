import 'package:flutter/material.dart';
import 'package:src/home_page/widgets/app_bar_widget.dart';
import 'package:src/home_page/widgets/bottom_navigation_widget.dart';
import 'package:src/pages/login_page.dart';
import 'package:src/splash_screen/splash_screen.dart';
import 'home_page/home_page.dart';
import 'package:src/pages/detail_page.dart';
import 'models/car.dart';
import 'package:src/pages/register_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String homePageRoute = '/home_page';

  @override
  Widget build(BuildContext context) {

    Car innovaZenix = Car(
      name: "Innova Zenix 2023",
      rentalPricePerDay: 400,
      type: "V Hybrid",
      description:
          "All New Kijang Innova Zenix 2023 is a spacious and fuel-efficient family car with seating for 7 people.",
      transmissionType: "Automatic",
      color: 'White',
      maxSpeed: 250,
      fuelCapacity: 52,
      doorCount: 4,
      seatCount: 7,
      rating: 4,
      photos: [
        "zenix_front.png",
        "zenix_back.png",
        "zenix_side.png",
      ],
    );

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