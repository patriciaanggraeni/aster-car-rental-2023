import 'package:aster_retsa_cars_rental/bloc/splash_screen_bloc/splash_screen_event.dart';
import 'package:aster_retsa_cars_rental/bloc/splash_screen_bloc/splash_screen_state.dart';
import 'package:bloc/bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SetSplashEvent>( (event, emit) async {
      emit(SplashLoadingState());
      await Future.delayed(const Duration(seconds: 5));
      emit(SplashLoadedState());
    } );
  }
}