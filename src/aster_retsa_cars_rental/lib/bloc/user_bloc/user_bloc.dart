import 'package:aster_retsa_cars_rental/bloc/user_bloc/user_event.dart';
import 'package:aster_retsa_cars_rental/bloc/user_bloc/user_state.dart';
import 'package:aster_retsa_cars_rental/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  UserBloc() : super(InitialUserState()) {
    on<FetchUserEvent>( (event, emit) async {
      try {
        QuerySnapshot querySnapshot = await _firebaseFirestore.collection('user').get();
        List<User> users = querySnapshot.docs.map( (DocumentSnapshot documentSnapshot) =>
          User.fromMap(documentSnapshot.data() as Map<String, dynamic>)
        ).toList();
        emit(LoadedUserState(users));
      } catch (e) {
        emit(ErrorUserState(e.toString()));
      }
    } );
  }
}