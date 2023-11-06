import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:src/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222525),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage("assets/images/splash_screen/text_logo.png"),
                fit: BoxFit.cover,
                isAntiAlias: true,
                width: 267,
                height: 115,
              ),
              const Image(
                image: AssetImage("assets/images/splash_screen/logo.png"),
                fit: BoxFit.cover,
                isAntiAlias: true,
                width: 375,
                height: 375,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Dream ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: 'Cars, ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: 'Real ',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: 'Journeys',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              _isLoading ? LoadingAnimationWidget.stretchedDots(
                color: Colors.white,
                size: 100,
              ) : ElevatedButton(
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
