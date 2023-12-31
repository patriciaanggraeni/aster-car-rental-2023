import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

import '../models/car.dart';
import '../widgets/detail_page_widget/button_bottom_widget.dart';
import '../widgets/detail_page_widget/date_picker_widget.dart';
import '../widgets/detail_page_widget/detail_car_widget.dart';
import '../widgets/detail_page_widget/image_carousel_widget.dart';
import '../widgets/detail_page_widget/input_location_widget.dart';
import '../widgets/detail_page_widget/payment_method_widget.dart';
import '../widgets/detail_page_widget/pickup_location_widget.dart';
import 'confirm_page.dart';

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
  String _location = '';
  String _date = '';
  double _price = 0;

  List<String> paymentMethods = ['Cash', 'Mastercard', 'Visa', 'Paypal'];
  String selectedPaymentMethod = 'Cash';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _inputLocation(BuildContext context) async {
    final result = await Navigator.push(
      context,
      PageTransition(
        ctx: context,
        child: InputLocationWidget(location: _location),
        inheritTheme: true,
        duration: const Duration(milliseconds: 500),
        type: PageTransitionType.fade,
      ),
    );
    setState(() {
      _location = result;
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
      int days = picked.end.difference(picked.start).inDays;
      setState(() {
        _date = '${_formatDate(picked.start)} to ${_formatDate(picked.end)}';
        _price = widget.car.price * days;
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
            if (_location.isNotEmpty && _date.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmPage(
                    car: widget.car,
                    date: _date,
                    rentPrice: _price,
                    location: _location,
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
                  location: _location,
                ),
                const SizedBox(height: 16),
                DatePickerWidget(
                  onPressed: _selectDateRange,
                  date: _date,
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
