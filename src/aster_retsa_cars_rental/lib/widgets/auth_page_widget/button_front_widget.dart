import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ButtonFront extends StatelessWidget {
  final String theText;
  final Function()? onTap;

  const ButtonFront({
    super.key,
    required this.theText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              theText,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 34, 37, 37),
              ),
            ),
          ],
        ),
      ),
    );
  }
}