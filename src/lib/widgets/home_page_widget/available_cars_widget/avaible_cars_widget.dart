import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/widgets/home_page_widget/available_cars_widget/price_widget.dart';
import 'package:src/widgets/home_page_widget/available_cars_widget/rating_widget.dart';
import '../../../models/car.dart';
import 'detail_car_widget.dart';
import 'name_widget.dart';

class CustomAvailableCarsWidget extends StatelessWidget {
  const CustomAvailableCarsWidget({super.key, required this.availableCars});
  final List availableCars;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Available Cars",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
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
                                SizedBox(
                                  width: 290,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                          "assets/images/cars/${availableCar.imageCover}"
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomNameWidget(availableCar: availableCar),
                                          CustomRatingWidget(availableCar: availableCar),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomDetailCarWidget(availableCar: availableCar),
                                          CustomPriceWidget(availableCar: availableCar),
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
                ),
              ),
            ],
          )
        ]
      ),
    );
  }
}