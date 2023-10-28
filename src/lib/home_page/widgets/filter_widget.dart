import 'package:flutter/material.dart';

class CustomFilterWidget extends StatelessWidget {
  const CustomFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: const Color(0xFF222525),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        "assets/icons/filter.png",
        color: Colors.white,
        width: 24,
        height: 24,
      )
    );
  }
}
