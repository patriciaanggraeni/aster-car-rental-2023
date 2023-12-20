import 'package:aster_retsa_cars_rental/models/history.dart';

abstract class HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<History> history;

  HistoryLoaded(this.history);
}

class HistoryError extends HistoryState {}
