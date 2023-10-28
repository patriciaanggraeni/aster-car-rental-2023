import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/Car.dart';

class CustomPriceWidget extends StatelessWidget {
  const CustomPriceWidget({super.key, required this.availableCar});
  final Car availableCar;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${availableCar.price.toInt().toString()}",
      style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
