abstract class UserEvent {
  const UserEvent();

  List<Object> get props => [];
}

class FetchUserEvent extends UserEvent {}