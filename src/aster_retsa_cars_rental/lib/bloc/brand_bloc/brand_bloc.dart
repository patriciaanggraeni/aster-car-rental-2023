import 'package:aster_retsa_cars_rental/bloc/brand_bloc/brand_event.dart';
import 'package:aster_retsa_cars_rental/bloc/brand_bloc/brand_state.dart';
import 'package:aster_retsa_cars_rental/models/brand.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState>{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  BrandBloc() : super(InitialBrandState()) {
    on<FetchBrandEvent>( (event, emit) async {
     try {
       QuerySnapshot querySnapshot = await _firebaseFirestore.collection('brand').get();
       List<Brand> brands = querySnapshot.docs.map( (DocumentSnapshot documentSnapshot) =>
           Brand.fromMap(documentSnapshot.data() as Map<String, dynamic>)
       ).toList();
       emit(LoadedBandState(brands));
     } catch (e) {
       emit(ErrorBrandState(e.toString()));
     }
    } );
  }
}