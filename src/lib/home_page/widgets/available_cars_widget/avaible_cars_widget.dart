import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/home_page/widgets/available_cars_widget/detail_car_widget.dart';
import 'package:src/home_page/widgets/available_cars_widget/name_and_rating_widget.dart';
import '../../model/Car.dart';

class CustomAvailableCarsWidget extends StatelessWidget {
  const CustomAvailableCarsWidget({super.key, required this.availableCars});
  final List availableCars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableCars.length,
        itemBuilder: (context, index) {
          Car availableCar = availableCars[index];
          return Card(
            color: const Color(0xFF222525),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Stack(
                children: [
                  Text(
                      "\$${availableCar.price.toInt().toString()}",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    width: 290,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage(availableCar.image)),
                        Column(
                          children: [
                            CustomNameRatingWidget(availableCar: availableCar),
                            const SizedBox(height: 10,),
                            CustomDetailCarWidget(availableCar: availableCar),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
