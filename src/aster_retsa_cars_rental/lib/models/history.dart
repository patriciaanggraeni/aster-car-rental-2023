import 'package:aster_retsa_cars_rental/models/car.dart';
import 'package:aster_retsa_cars_rental/repositories/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  final String id;
  final Future<Car> car;
  final String date;
  final double price;
  final String userId;

  History({
    required this.id,
    required this.car,
    required this.date,
    required this.price,
    required this.userId,
  });

  factory History.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return History(
      id: doc.id,
      car: Repository().getCarDetails(data['carName']),
      date: data['date'] ?? '',
      price: data['price'] ?? 0,
      userId: data['userId'] ?? '',
    );
  }
}
