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
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableCars.length,
        itemBuilder: (context, index) {
          Car availableCar = this.availableCars[index];
          return Card(
            color: Color(0xFF222525),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 290,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(image: AssetImage(availableCar.image)),
                    CustomNameRatingWidget(availableCar: availableCar),
                    CustomDetailCarWidget(availableCar: availableCar),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
