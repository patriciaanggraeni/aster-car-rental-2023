import 'dart:io';

import 'package:aster_retsa_cars_rental/constants/constants.dart';
import 'package:aster_retsa_cars_rental/pages/home_page.dart';
import 'package:aster_retsa_cars_rental/utils/auth_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:page_transition/page_transition.dart';

class ResultScanPage extends StatefulWidget {
  const ResultScanPage({
    super.key,
    required this.picture,
    required this.carName,
    required this.date,
    required this.rentPrice,
  });

  final String picture;
  final String carName, date;
  final double rentPrice;

  @override
  State<ResultScanPage> createState() => _ResultScanPageState();
}

class _ResultScanPageState extends State<ResultScanPage> {
  bool _success = true;
  late Future<String?> _nikDetect;

  @override
  void initState() {
    super.initState();
    _nikDetect = recognizeText();
  }

  Future<String?> getCurrentUserNIK() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      if (userDoc.exists) {
        return userDoc.get('nik');
      }
    }
    return null;
  }

  Future<String?> recognizeText() async {
    final inputImage = InputImage.fromFilePath(widget.picture);
    final TextRecognizer textDetector = TextRecognizer();
    final recognisedText = await textDetector.processImage(inputImage);

    RegExp regEx = RegExp(nikPattern);
    String? nik;

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        String text = line.text
            .trim()
            .replaceAll(" ", "")
            .replaceAll('D', '0')
            .replaceAll('I', '1')
            .replaceAll('b', '6')
            .replaceAll('L', '6')
            .replaceAll('B', '8');

        if (regEx.hasMatch(text)) {
          nik = text;
          String? currentUserNIK = await getCurrentUserNIK();

          if (currentUserNIK == nik) {
            setState(() {
              _success = true;
            });
          }
          return nik;
        }
      }
    }
    return null;
  }

  Future<DocumentReference> addHistoryEntry({
    required String carName,
    required String date,
    required double price,
  }) async {
    CollectionReference history =
        FirebaseFirestore.instance.collection('history');

    return history.add({
      'carName': carName,
      'date': date,
      'price': price,
      'userId': AuthUtils.getCurrentUserId(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<String?>(
          future: _nikDetect,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.file(
                        File(widget.picture),
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _success
                            ? "Validation is successful! 😊"
                            : "Validation is not successful 😔",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF222525),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _success
                            ? "Your ID Card has been validated successfully."
                            : "Validation failed. Please recheck your ID Card.",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF222525),
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "NIK Detect: ${snapshot.data}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF222525),
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ],
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
                      if (_success) {
                        addHistoryEntry(
                          carName: widget.carName,
                          date: widget.date,
                          price: widget.rentPrice,
                        );
                        Navigator.push(
                          context,
                          PageTransition(
                            ctx: context,
                            child: const HomePage(),
                            inheritTheme: true,
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.fade,
                          ),
                        );
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          _success
                              ? "assets/icons/home.png"
                              : "assets/icons/retry.png",
                          width: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _success ? "Go to Home" : "Scan Again",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
