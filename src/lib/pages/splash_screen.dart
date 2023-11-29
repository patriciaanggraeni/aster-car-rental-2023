import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_bloc.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:src/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenBloc _splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    _splashScreenBloc.add(SetSplashScreenEvent());
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
              BlocBuilder<SplashScreenBloc, SplashScreenState>(
                bloc: _splashScreenBloc,
                builder: (context, state) {
                  if (state is LoadingSplashScreenState) {

                  } else if (state is LoadedSplashScreenState) {
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
