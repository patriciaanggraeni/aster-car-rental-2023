import 'package:flutter/material.dart';
import 'package:src/pages/detail_page.dart';

import 'models/car.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

    return MaterialApp(
      title: 'Aster Retsa',
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          background: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: DetailPage(car: innovaZenix),
    );
  }
}
