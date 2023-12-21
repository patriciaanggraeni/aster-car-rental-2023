import 'package:aster_retsa_cars_rental/bloc/profile_bloc/profile_event.dart';
import 'package:aster_retsa_cars_rental/bloc/profile_bloc/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _onLoadUserProfile(
      LoadUserProfile event, Emitter<ProfileState> emit) async {
    try {
      var doc = await firestore.collection('user').doc(event.userId).get();
      var user = User.fromMap(doc.data()!);
      emit(UserProfileLoaded(user));
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }

  void _onUpdateUserProfile(
      UpdateUserProfile event, Emitter<ProfileState> emit) async {
    try {
      await firestore
          .collection('user')
          .doc(event.user.id)
          .update(event.user.toMap());
      emit(UserProfileLoaded(event.user));
    } catch (e) {
      emit(UserProfileError(e.toString()));
    }
  }
}
