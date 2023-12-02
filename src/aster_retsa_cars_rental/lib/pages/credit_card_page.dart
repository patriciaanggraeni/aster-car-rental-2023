import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../widgets/bottom_sheet_widget/failed_bottom_modal_widget.dart';
import '../widgets/detail_page_widget/button_bottom_widget.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({super.key});

  @override
  State<StatefulWidget> createState() => CreditCardPageState();
}

class CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool isCardSaved = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mastercard'),
        backgroundColor: const Color(0xFF252525),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            priceDetail('Sub-total', '\$45.00'),
            priceDetail('Delivery', '\$10.00'),
            priceDetail('Total to pay', '\$55.00', isBold: true),
            const SizedBox(height: 10),
            ButtonBottomWidget(
              name: 'Pay Now',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => const CustomFailedBottomModalWidget(),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          CreditCardWidget(
            cardBgColor: const Color(0XFF222525),
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            bankName: 'Mastercard',
            showBackView: isCvvFocused,
            obscureCardNumber: false,
            obscureCardCvv: false,
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
          ),
          Column(
            children: [
              CreditCardForm(
                formKey: formKey,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                inputConfiguration: InputConfiguration(
                  cardNumberDecoration: inputText(
                      label: 'Number', hintText: 'XXXX XXXX XXXX XXXX'),
                  expiryDateDecoration:
                      inputText(label: 'Expired Date', hintText: 'XX/XX'),
                  cvvCodeDecoration: inputText(label: 'CVV', hintText: 'XXX'),
                  cardHolderDecoration: inputText(
                    label: 'Card Holder',
                  ),
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0XFF222525),
                    value: isCardSaved,
                    onChanged: (bool? value) {
                      setState(() {
                        isCardSaved = value!;
                      });
                    },
                  ),
                  const Text('Save Card'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration inputText({
    required String label,
    String? hintText,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hintText,
      labelStyle: const TextStyle(fontSize: 14),
      hintStyle: const TextStyle(fontSize: 14),
      contentPadding: const EdgeInsets.all(14),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  Widget priceDetail(String label, String price, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isBold ? const TextStyle(fontWeight: FontWeight.bold) : null,
          ),
          Text(
            price,
            style: isBold ? const TextStyle(fontWeight: FontWeight.bold) : null,
          ),
        ],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
