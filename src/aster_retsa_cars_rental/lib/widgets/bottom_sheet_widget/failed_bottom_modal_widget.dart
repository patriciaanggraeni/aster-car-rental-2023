import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../pages/home_page.dart';

class CustomFailedBottomModalWidget extends StatelessWidget {
  const CustomFailedBottomModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/failed.png",
              width: 75,
            ),
            Text(
              "validation is not successfuly :(",
              style: GoogleFonts.poppins(
                color: const Color(0xFF222525),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Opacity(
              opacity: .4,
              child: Text(
                "Sorry, there was a problem validating your data, please check your data again so that the validation process can run.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF222525),
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(323, 40),
                backgroundColor: const Color(0xFF222525),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                 Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/retry.png",
                    width: 20,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    "Scan Again",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
