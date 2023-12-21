import 'package:aster_retsa_cars_rental/models/user.dart';

abstract class ProfileEvent {}

class LoadUserProfile extends ProfileEvent {
  final String userId;

  LoadUserProfile(this.userId);
}

class UpdateUserProfile extends ProfileEvent {
  final User user;

  UpdateUserProfile(this.user);
}
