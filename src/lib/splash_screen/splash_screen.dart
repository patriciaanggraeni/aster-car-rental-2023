import 'package:flutter/material.dart';
import 'package:src/main.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          _isLoading = false;
        });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222525),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/text_logo.png"),
              fit: BoxFit.cover,
              isAntiAlias: true,
              width: 267,
              height: 115,
            ),
            const Image(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
              isAntiAlias: true,
              width: 375,
              height: 375,
            ),
             RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Dream ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Mengatur tebal untuk "Dream"
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: 'Cars, ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: 'Real ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // Mengatur tebal untuk "Real"
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: 'Journeys',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            _isLoading ? CircularProgressIndicator(
              color: Colors.white,
            ) : ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(345, 50),
                backgroundColor: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, MyApp.homePageRoute);
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
    );
  }
}