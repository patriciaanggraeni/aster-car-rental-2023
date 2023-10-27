import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, User!",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF222525),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Welcome to Aster Retsa",
                  style: GoogleFonts.poppins(
                    color: Color(0xFF222525),
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
              ],
            )
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