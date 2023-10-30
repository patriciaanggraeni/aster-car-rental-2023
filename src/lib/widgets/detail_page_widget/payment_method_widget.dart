import 'package:flutter/material.dart';

import 'section_title_widget.dart';

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({
    super.key,
    required this.selectedPaymentMethod,
    required this.paymentMethods,
    required this.onPressed,
  });

  final List<String> paymentMethods;
  final String selectedPaymentMethod;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitleWidget(title: 'Payment Method'),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: PaymentMethodItemWidget(
                icon: 'cash',
                isSelected: selectedPaymentMethod == paymentMethods[0],
                onPressed: () => onPressed(paymentMethods[0]),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: PaymentMethodItemWidget(
                icon: 'mastercard',
                isSelected: selectedPaymentMethod == paymentMethods[1],
                onPressed: () => onPressed(paymentMethods[1]),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: PaymentMethodItemWidget(
                icon: 'visa',
                isSelected: selectedPaymentMethod == paymentMethods[2],
                onPressed: () => onPressed(paymentMethods[2]),
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 5,
              child: PaymentMethodItemWidget(
                icon: 'paypal',
                isSelected: selectedPaymentMethod == paymentMethods[3],
                onPressed: () => onPressed(paymentMethods[3]),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onPressed,
  });

  final String icon;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor:
              isSelected ? const Color.fromRGBO(25, 25, 25, 1) : Colors.white,
        ),
        // icon: Icon(
        //   icon,
        //   size: 36,
        //   color: isSelected ? Colors.white : Colors.black,
        // ),
        child: Image.asset(
          'assets/icons/$icon.png',
          color:
              isSelected ? Colors.white : const Color.fromRGBO(25, 25, 25, 1),
          width: 38,
        ),
      ),
    );
  }
}
