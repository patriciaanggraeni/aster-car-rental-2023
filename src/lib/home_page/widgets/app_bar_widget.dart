import 'package:flutter/material.dart';
import 'package:src/home_page/widgets/greeting_widget.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/icons/menu.png",
              color: Color(0xFF222525),
              width: 35,
            ),
            const SizedBox(width: 15,),
            CustomGreetingWidget(),
          ],
        ),
        Image.asset(
          "assets/icons/account.png",
          width: 35,
          color: Color(0xFF222525),
        ),
      ],
    );
  }
}