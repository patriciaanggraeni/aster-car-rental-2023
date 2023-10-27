import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/Car.dart';

class CustomNameRatingWidget extends StatelessWidget {
  const CustomNameRatingWidget({super.key, required this.availableCar});
  final Car availableCar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          availableCar.name,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
        ),
        Row(
          children: [
            Text(
              availableCar.rating.toString(),
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.white,
              size: 14,
            ),
          ],
        ),
      ],
    );
  }
}
