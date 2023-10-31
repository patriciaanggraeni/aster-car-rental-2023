import 'package:flutter/material.dart';
import 'package:src/main.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
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
          child: ListView(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("assets/images/splash_screen/text_logo.png"),
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                    width: 267,
                    height: 115,
                  ),
                  SizedBox(height: 20,),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Dream ',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Cars, ',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Real ',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: 'Journeys',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Image(
                    image: AssetImage("assets/images/splash_screen/logo.png"),
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                    width: 350,
                    height: 350,
                  ),
                  SizedBox(
                    width: 300,
                    child: RichText(
                      maxLines: 6,
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: 'We provide luxury car rental services '
                                'which you can access via Aster Retsa '
                                'easily. We offer the best prices on the '
                                'market and we guarantee you will not be '
                                'disappointed. You can rent with a '
                                'predetermined agreement, unlimited '
                                'time limit, only with the guarantee of an '
                                'ID card.',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),      
                      ),
                    ),
                  ),
                  // Text(
                  //     "We provide luxury car rental services which you can access via Aster Retsa easily. We offer the best prices on the market and we guarantee you will not be disappointed. You can rent with a predetermined agreement, unlimited time limit, only with the guarantee of an ID card.",
                  //     style: GoogleFonts.poppins(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 12,
                  //     )),
                  const SizedBox(height: 20),
                  _isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : ElevatedButton(
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
                            Navigator.pushReplacementNamed(
                                context, MyApp.homePageRoute);
                          },
                          child: Text(
                            "Back",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}
