import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:page_transition/page_transition.dart";
import "../../pages/login_page.dart";

class SplashButtonWidget extends StatelessWidget {
  const SplashButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(345, 50),
        backgroundColor: const Color(0xFFFFFFFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
              ctx: context,
              child: const LoginPage(),
              inheritTheme: true,
              alignment: Alignment.bottomCenter,
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.rightToLeft),
        );
        },
      child: Text(
        "Let's Go",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
