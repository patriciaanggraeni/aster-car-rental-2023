import '../../models/car.dart';

abstract class CarState {
  const CarState();

  List<Object> get props => [];
}

class InitialCarState extends CarState {}

class LoadedCarState extends CarState {
   final List<Car> cars;
   LoadedCarState(this.cars);

   @override
   List<Object> get props => [cars];
}

class ErrorCarState extends CarState {
  final String error;
  ErrorCarState(this.error);

  @override
  List<Object> get props => [error];
}