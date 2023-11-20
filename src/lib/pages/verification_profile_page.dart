import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:src/pages/scan_page.dart';

class VerificationProfilePage extends StatelessWidget {
  const VerificationProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252525),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 24,
              top: 24,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/icons/id-card.png',
                          color: Colors.white,
                          width: 220,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Upload a valid ID Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Do not upload photocopies or prints, and photos must fit in the frame,',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Why do you need verification?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      whyVerifyItem('Mandatory condition for renting a car'),
                      whyVerifyItem('Make sure profile data is 100% accurate'),
                      whyVerifyItem(
                          'Identification information is stored securely'),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      ctx: context,
                      child: const ScanPage(),
                      inheritTheme: true,
                      duration: const Duration(milliseconds: 500),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
                child: Container(
                  height: 37,
                  margin: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding whyVerifyItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
