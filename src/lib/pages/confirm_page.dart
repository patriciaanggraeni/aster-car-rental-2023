import 'package:flutter/material.dart';
import '../models/car.dart';
import '../widgets/detail_page_widget/button_bottom_widget.dart';
import '../widgets/detail_page_widget/mini_detail_car_widget.dart';

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
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonBottomWidget(
              name: 'Scan ID Card',
              icon: Icons.qr_code_scanner,
            ),
            ButtonBottomWidget(name: 'Confirm'),
          ],
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/cars/innova_zenix/${car.photos[0]}'),
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
