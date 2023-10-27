import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/Car.dart';

class CustomDetailCarWidget extends StatelessWidget {
  const CustomDetailCarWidget({super.key, required this.availableCar});
  final Car availableCar;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.speed,
              color: Colors.white,
              size: 15,
            ),
            Text(
              "${availableCar.speed.toString()}km/h",
               style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.gas_meter,
              color: Colors.white,
              size: 15,
            ),
            Text(
              "${availableCar.tank.toString()}Ltr",
               style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.event_seat,
              color: Colors.white,
              size: 15,
            ),
            Text(
              "${availableCar.seat.toString()}",
               style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
