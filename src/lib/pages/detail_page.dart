import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:src/pages/confirm_page.dart';

import '../models/car.dart';
import '../widgets/detail_page_widget/button_bottom_widget.dart';
import '../widgets/detail_page_widget/date_picker_widget.dart';
import '../widgets/detail_page_widget/detail_car_widget.dart';
import '../widgets/detail_page_widget/image_carousel_widget.dart';
import '../widgets/detail_page_widget/input_location_widget.dart';
import '../widgets/detail_page_widget/payment_method_widget.dart';
import '../widgets/detail_page_widget/pickup_location_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String location = '';
  String date = '';

  List<String> paymentMethods = ['Cash', 'Mastercard', 'Visa', 'Paypal'];
  String selectedPaymentMethod = 'Cash';

  void _inputLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InputLocationWidget(location: location),
      ),
    );
    setState(() {
      location = result;
    });
  }

  void _selectDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        date = '${_formatDate(picked.start)} to ${_formatDate(picked.end)}';
      });
    }
  }

  String _formatDate(DateTime dateTime) {
    var dayFormat = NumberFormat('0');
    var monthFormat = DateFormat('MMMM');
    return '${dayFormat.format(dateTime.day)}th ${monthFormat.format(dateTime)}';
  }

  void _selectPaymentMethod(String nameMethod) {
    setState(() {
      selectedPaymentMethod = nameMethod;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ButtonBottomWidget(
          name: 'Rent',
          onPressed: () {
            if (location.isNotEmpty && date.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmPage(
                    car: widget.car,
                    date: date,
                    location: location,
                    paymentMethod: selectedPaymentMethod,
                  ),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color(0XFF222525),
                  content: Text('Please fill in both the location and date'),
                ),
              );
            }
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 262,
            color: const Color(0XFF222525),
            child: ImageSliderWidget(images: widget.car.photos),
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                DetailCarWidget(
                  car: widget.car,
                ),
                const SizedBox(height: 16),
                PickupLocationWidget(
                  onPressed: () => _inputLocation(context),
                  location: location,
                ),
                const SizedBox(height: 16),
                DatePickerWidget(
                  onPressed: _selectDateRange,
                  date: date,
                ),
                const SizedBox(height: 16),
                PaymentMethodWidget(
                  onPressed: _selectPaymentMethod,
                  paymentMethods: paymentMethods,
                  selectedPaymentMethod: selectedPaymentMethod,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
