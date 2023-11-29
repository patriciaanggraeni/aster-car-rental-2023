import 'package:bloc/bloc.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(InitialSplashScreenState()) {
    on<SetSplashScreenEvent>( (event, emit) async {
      emit(LoadingSplashScreenState());
      await Future.delayed(const Duration(seconds: 5));
      emit(LoadedSplashScreenState());
    } );
  }
}