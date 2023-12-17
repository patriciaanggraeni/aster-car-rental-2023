import 'package:aster_retsa_cars_rental/pages/result_scan_page.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VerificationProfilePage extends StatefulWidget {
  const VerificationProfilePage({super.key});

  @override
  State<VerificationProfilePage> createState() =>
      _VerificationProfilePageState();
}

class _VerificationProfilePageState extends State<VerificationProfilePage> {
  String? _imagePath;

  Future<void> getImageFromCamera() async {
    bool isCameraGranted = await Permission.camera.request().isGranted;
    if (!isCameraGranted) {
      isCameraGranted =
          await Permission.camera.request() == PermissionStatus.granted;
    }

    if (!isCameraGranted) {
      return;
    }

    String imagePath = join((await getApplicationSupportDirectory()).path,
        "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

    bool success = false;

    success = await EdgeDetection.detectEdge(
      imagePath,
      androidScanTitle: 'Scanning',
      androidCropTitle: 'Crop',
      androidCropBlackWhiteTitle: 'Grayscale',
      androidCropReset: 'Reset',
      canUseGallery: false,
    );

    if (!mounted) return;

    setState(() {
      if (success) {
        _imagePath = imagePath;
      }
    });
  }

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
                  getImageFromCamera().whenComplete(() {
                    if (_imagePath != null) {
                      Navigator.push(
                        context,
                        PageTransition(
                          ctx: context,
                          child: ResultScanPage(picture: _imagePath!),
                          inheritTheme: true,
                          duration: const Duration(milliseconds: 500),
                          type: PageTransitionType.fade,
                        ),
                      );
                    }
                  });
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
