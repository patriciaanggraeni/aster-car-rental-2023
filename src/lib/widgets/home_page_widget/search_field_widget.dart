import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchFieldWidget extends StatelessWidget {
  const CustomSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 280,
      child: TextField(
        cursorColor: const Color(0xFF222525),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              "assets/icons/search.png",
              color: const Color(0xFF222525),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0XFF222525),
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0XFF222525),
              width: 1,
            ),
          ),
          hintText: "Search for a Car",
          hintStyle: GoogleFonts.poppins(
            color: const Color(0x50222525),
            fontSize: 16,
            fontWeight: FontWeight.normal
          )
        ),
      ),
    );
  }
}
