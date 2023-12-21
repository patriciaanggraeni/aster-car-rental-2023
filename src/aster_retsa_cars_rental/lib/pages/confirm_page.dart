import 'package:aster_retsa_cars_rental/pages/home_page.dart';
import 'package:aster_retsa_cars_rental/pages/verification_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/car.dart';
import '../widgets/detail_page_widget/button_bottom_widget.dart';
import '../widgets/detail_page_widget/mini_detail_car_widget.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({
    super.key,
    required this.car,
    required this.date,
    required this.rentPrice,
    required this.location,
    required this.paymentMethod,
  });

  final Car car;
  final String date, location, paymentMethod;
  final double rentPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ButtonBottomWidget(
          name: 'Scan ID Card',
          icon: Icons.qr_code_scanner,
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                ctx: context,
                child: VerificationProfilePage(
                  carName: car.name,
                  date: date,
                  rentPrice: rentPrice,
                ),
                inheritTheme: true,
                duration: const Duration(milliseconds: 500),
                type: PageTransitionType.fade,
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(car.imageCover, width: 300),
              const SizedBox(height: 12),
              const Text(
                'We need to complete the process, please scan your ID Card.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black, fontFamily: 'Poppins'),
                  children: [
                    const TextSpan(text: 'You will rent a '),
                    TextSpan(
                      text: '${car.name} ${car.type}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' with a rental price '),
                    TextSpan(
                      text: '\$$rentPrice',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: ' use $paymentMethod from $date at $location.'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MiniDetailCarWidget(
                    attribute: 'Color',
                    value: car.color,
                  ),
                  MiniDetailCarWidget(
                    attribute: 'Seat',
                    value: '${car.seatCount.toString()} Seats',
                  ),
                  MiniDetailCarWidget(
                    attribute: 'Door',
                    value: '${car.doorCount} Doors',
                  ),
                  MiniDetailCarWidget(
                    attribute: 'Fuel',
                    value: '${car.fuelCapacity.toString()} Litre',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
