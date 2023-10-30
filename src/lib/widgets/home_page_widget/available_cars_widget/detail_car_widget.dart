import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/car.dart';

class CustomDetailCarWidget extends StatelessWidget {
  const CustomDetailCarWidget({super.key, required this.availableCar});
  final Car availableCar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                width: 12,
                "assets/icons/speedometer.png"
              ),
              const SizedBox(width: 3,),
              Text(
                "${availableCar.maxSpeed.toString()}km/h",
                 style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                width: 12,
                "assets/icons/gas_station.png"
              ),
              const SizedBox(width: 3,),
              Text(
                "${availableCar.fuelCapacity.toString()}Ltr",
                 style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                width: 12,
                "assets/icons/car_seat.png"
              ),
              const SizedBox(width: 3,),
              Text(
                availableCar.seatCount.toString(),
                 style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
