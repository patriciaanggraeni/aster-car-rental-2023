import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_screen_bloc/splash_screen_bloc.dart';
import '../bloc/splash_screen_bloc/splash_screen_event.dart';
import '../bloc/splash_screen_bloc/splash_screen_state.dart';
import '../widgets/splash_screen_widget/splash_button_widget.dart';
import '../widgets/splash_screen_widget/splash_loading_widget.dart';
import '../widgets/splash_screen_widget/splash_logo_wiget.dart';
import '../widgets/splash_screen_widget/splash_rich_text_widget.dart';
import '../widgets/splash_screen_widget/splash_text_logo_widget.dart';

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
              const SplashTextLogoWidget(),
              const SplashLogoWidget(),
              const SplashRichTextWidget(),
              BlocBuilder<SplashBloc, SplashState>(
                bloc: _splashScreenBloc,
                builder: (context, state) {
                  if (state is SplashLoadingState) {
                    return const SplashLoadingWidget();
                  } else if (state is SplashLoadedState) {
                    return const SplashButtonWidget();
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
