import 'package:aster_retsa_cars_rental/models/car.dart';
import 'package:aster_retsa_cars_rental/models/history.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Repository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<History>> fetchHistory(String userId) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('history')
          .where('userId', isEqualTo: userId)
          .get();

      return querySnapshot.docs
          .map((doc) => History.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw Exception('Error fetching history: $e');
    }
  }

  Future<Car> getCarDetails(String carName) async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('car')
          .where('name', isEqualTo: carName)
          .get();

      return Car.fromMap(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Error fetching car details: $e');
    }
  }

  Future<void> createUserProfile({
    required String userId,
    required String email,
  }) async {
    await firestore.collection('user').doc(userId).set({
      'id': userId,
      'email': email,
    });
  }
}
