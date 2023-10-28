import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/Car.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({super.key, required this.availableCar});
  final Car availableCar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          availableCar.rating.toString(),
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
        const Icon(
          Icons.star,
          color: Colors.white,
          size: 15,
        ),
      ],
    );
  }
}
