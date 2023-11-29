import "package:flutter/material.dart";

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Image(
      image: AssetImage("assets/images/splash_screen/logo.png"),
      fit: BoxFit.cover,
      isAntiAlias: true,
      width: 375,
      height: 375,
    );
  }
}
