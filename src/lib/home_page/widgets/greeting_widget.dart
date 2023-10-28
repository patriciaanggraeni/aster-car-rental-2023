import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomGreetingWidget extends StatelessWidget {
  const CustomGreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, User!",
          style: GoogleFonts.poppins(
            color: const Color(0xFF222525),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Text(
          "Welcome to Aster Retsa",
          style: GoogleFonts.poppins(
            color: const Color(0xFF222525),
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
