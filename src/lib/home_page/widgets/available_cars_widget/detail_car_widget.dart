import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/model/Car.dart';

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
                "${availableCar.speed.toString()}km/h",
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
                "${availableCar.tank.toString()}Ltr",
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
                availableCar.seat.toString(),
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
