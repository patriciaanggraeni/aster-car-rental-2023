import 'package:aster_retsa_cars_rental/models/user.dart';

abstract class UserState {
  const UserState();

  List<Object> get props => [];
}

class InitialUserState extends UserState {}

class LoadedUserState extends UserState {
   final List<User> users;
   LoadedUserState(this.users);

   @override
   List<Object> get props => [users];
}

class ErrorUserState extends UserState {
  final String error;
  ErrorUserState(this.error);

  @override
  List<Object> get props => [error];
}