import 'dart:async';
import 'package:aster_retsa_cars_rental/bloc/car_bloc/car_event.dart';
import 'package:aster_retsa_cars_rental/bloc/car_bloc/car_state.dart';
import 'package:aster_retsa_cars_rental/models/car.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  CarBloc(super.initialState);
  CarState get initialState => InitialCarState();

  Stream<CarState> mapEventToState(CarEvent event) async* {
    if (event is FetchCarsEvent) {
      try {
        QuerySnapshot querySnapshot = await _firebaseFirestore.collection('car').get();
        List<Car> cars = querySnapshot.docs.map( (DocumentSnapshot documentSnapshot) =>
          Car.fromMap(documentSnapshot.data() as Map<String, dynamic>)
        ).toList();
        yield LoadedCarState(cars);
      } catch (e) {
        yield ErrorCarState(e.toString());
      }
    }
  }
}