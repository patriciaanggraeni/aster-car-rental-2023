import 'dart:async';
import 'package:aster_retsa_cars_rental/bloc/car_bloc/car_event.dart';
import 'package:aster_retsa_cars_rental/bloc/car_bloc/car_state.dart';
import 'package:aster_retsa_cars_rental/models/car.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  CarBloc() : super(InitialCarState()) {
    on<FetchCarsEvent>((event, emit) async {
      try {
        QuerySnapshot querySnapshot =
            await _firebaseFirestore.collection('car').get();
        List<Car> cars = querySnapshot.docs
            .map((DocumentSnapshot documentSnapshot) =>
                Car.fromMap(documentSnapshot.data() as Map<String, dynamic>))
            .toList();
        emit(LoadedCarState(cars));
      } catch (e) {
        emit(ErrorCarState(e.toString()));
      }
    });
  }
}
