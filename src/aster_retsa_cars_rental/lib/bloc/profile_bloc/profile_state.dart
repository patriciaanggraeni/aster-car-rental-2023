import 'package:aster_retsa_cars_rental/models/user.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UserProfileLoaded extends ProfileState {
  final User user;

  UserProfileLoaded(this.user);
}

class UserProfileError extends ProfileState {
  final String message;

  UserProfileError(this.message);
}
