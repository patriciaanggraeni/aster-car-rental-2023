import "package:flutter/material.dart";
import "package:loading_animation_widget/loading_animation_widget.dart";

class SplashLoadingWidget extends StatelessWidget {
  const SplashLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.stretchedDots(
      color: Colors.white,
      size: 100,
    );
  }
}
