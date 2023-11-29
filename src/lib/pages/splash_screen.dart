import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:src/pages/login_page.dart';
import 'package:src/widgets/splash_screen_widget/splash_logo_wiget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashBloc _splashScreenBloc = SplashBloc();

  @override
  void initState() {
    _splashScreenBloc.add(SetSplashEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222525),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<SplashBloc, SplashState>(
                bloc: _splashScreenBloc,
                builder: (context, state) {
                  if (state is SplashLoadingState) {

                  } else if (state is SplashLoadedState) {

                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
