import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;

  int selectedCamera = 1;

  @override
  void initState() {
    super.initState();
    initializeControllerFuture = startCamera(selectedCamera);
  }

  Future<void> startCamera(int direction) async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );

    cameraController.setFlashMode(FlashMode.torch);

    return cameraController.initialize();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  void _setFlashMode() {
    setState(() {
      if (cameraController.value.flashMode == FlashMode.off) {
        cameraController.setFlashMode(FlashMode.torch);
      } else if (cameraController.value.flashMode == FlashMode.torch) {
        cameraController.setFlashMode(FlashMode.auto);
      } else {
        cameraController.setFlashMode(FlashMode.off);
      }
    });
  }

  IconData _iconFlashMode() {
    if (cameraController.value.flashMode == FlashMode.off) {
      return Icons.flash_off_rounded;
    } else if (cameraController.value.flashMode == FlashMode.torch) {
      return Icons.flash_on_rounded;
    } else {
      return Icons.flash_auto_rounded;
    }
  }

  void _switchCamera() {
    setState(() {
      selectedCamera = selectedCamera == 0 ? 1 : 0;
      initializeControllerFuture = startCamera(selectedCamera);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Scan ID Card'),
              backgroundColor: const Color(0xFF252525),
            ),
            body: scan(),
          );
        } else {
          return Center(
            child: LoadingAnimationWidget.stretchedDots(
              color: Colors.white,
              size: 100,
            ),
          );
        }
      },
    );
  }

  Widget scan() {
    return Stack(
      fit: StackFit.expand,
      children: [
        CameraPreview(cameraController),
        Image.asset(
          'assets/images/scan/layer_scan.png',
          fit: BoxFit.fitWidth,
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 12),
            child: Text(
              'ID card must be within the frame and in focus. All text must be clear and readable.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: const Color.fromRGBO(25, 25, 25, .5),
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                cameraButton(
                  icon: _iconFlashMode(),
                  size: 27,
                  onTap: _setFlashMode,
                ),
                cameraButton(icon: Icons.camera_rounded, size: 42),
                cameraButton(
                  icon: selectedCamera == 0
                      ? Icons.camera_rear
                      : Icons.camera_front,
                  size: 27,
                  onTap: _switchCamera,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  InkWell cameraButton({
    required IconData icon,
    required double size,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon, size: size),
      ),
    );
  }
}
