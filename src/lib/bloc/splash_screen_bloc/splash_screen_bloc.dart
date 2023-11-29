import 'package:bloc/bloc.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:src/bloc/splash_screen_bloc/splash_screen_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SetSplashEvent>( (event, emit) async {
      emit(SplashLoadingState());
      await Future.delayed(const Duration(seconds: 5));
      emit(SplashLoadedState());
    } );
  }
}