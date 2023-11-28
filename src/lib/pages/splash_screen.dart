import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:src/pages/login_page.dart';
import 'package:src/pages/splash_bloc/splash_bloc.dart';
import 'package:src/pages/splash_bloc/splash_event.dart';
import 'package:src/pages/splash_bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final SplashBloc splashBloc = SplashBloc();
   splashBloc.add(SetSplash());

    return Scaffold(
      backgroundColor: const Color(0xFF222525),
      body: SafeArea(
        child: BlocBuilder<SplashBloc, SplashState>(
          bloc: splashBloc,
          builder: (context, state) {
            return _buildSplashWidget(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildSplashWidget(BuildContext context, SplashState state) {
    return Column(
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
        _buildButtonAction(context, state),
      ],
    );
  }

  Widget _buildButtonAction(BuildContext context, SplashState state) {
    if (state is SplashLoading) {
      return LoadingAnimationWidget.stretchedDots(
        color: Colors.white,
        size: 100,
      );
    } else if (state is SplashLoaded) {
      return _buildButtonWidget(context);
    } else {
      return const SizedBox();
    }
  }

  Widget _buildButtonWidget(BuildContext context) {
    return ElevatedButton(
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
        Navigator.push(
          context,
          PageTransition(
              ctx: context,
              child: const LoginPage(),
              inheritTheme: true,
              alignment: Alignment.bottomCenter,
              duration: const Duration(milliseconds: 500),
              type: PageTransitionType.rightToLeft),
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
    );
  }
}
