import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/Car.dart';

class CustomNameWidget extends StatelessWidget {
  const CustomNameWidget({super.key, required this.availableCar});
  final Car availableCar;

  @override
  Widget build(BuildContext context) {
    return Text(
      availableCar.name,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
    );
  }
}
