import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src/pages/splash_bloc/splash_event.dart';
import 'package:src/pages/splash_bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SetSplash>((event, emit) async {
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 5));
      emit(SplashLoaded());
    });
  }
}