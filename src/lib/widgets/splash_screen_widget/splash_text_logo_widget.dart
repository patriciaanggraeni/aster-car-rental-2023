import "package:flutter/material.dart";

class SplashScreenTextLogoWidget extends StatelessWidget {
  const SplashScreenTextLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage("assets/images/splash_screen/text_logo.png"),
      fit: BoxFit.cover,
      isAntiAlias: true,
      width: 267,
      height: 115,
    );
  }
}
