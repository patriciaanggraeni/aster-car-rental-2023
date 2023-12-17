import 'package:aster_retsa_cars_rental/pages/verification_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../models/car.dart';
import '../widgets/detail_page_widget/button_bottom_widget.dart';
import '../widgets/detail_page_widget/mini_detail_car_widget.dart';
import 'credit_card_page.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({
    super.key,
    required this.car,
    required this.date,
    required this.location,
    required this.paymentMethod,
  });

  final Car car;
  final String date, location, paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonBottomWidget(
              name: 'Scan ID Card',
              icon: Icons.qr_code_scanner,
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    ctx: context,
                    child: const VerificationProfilePage(),
                    inheritTheme: true,
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.fade,
                  ),
                );
              },
            ),
            ButtonBottomWidget(
              name: 'Confirm',
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    ctx: context,
                    child: const CreditCardPage(),
                    inheritTheme: true,
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.fade,
                  ),
                );
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/${car.photos[0]}'),
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
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' with a $paymentMethod from $date at $location.'),
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
