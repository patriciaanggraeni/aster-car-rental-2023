import 'package:aster_retsa_cars_rental/bloc/history_bloc/history_event.dart';
import 'package:aster_retsa_cars_rental/bloc/history_bloc/history_state.dart';
import 'package:aster_retsa_cars_rental/repositories/repository.dart';
import 'package:aster_retsa_cars_rental/utils/auth_utils.dart';
import 'package:bloc/bloc.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final Repository repository;

  HistoryBloc(this.repository) : super(HistoryLoading()) {
    on<LoadHistory>((event, emit) async {
      try {
        String userId = AuthUtils.getCurrentUserId();
        final history = await repository.fetchHistory(userId);
        emit(HistoryLoaded(history));
      } catch (e) {
        emit(HistoryError());
      }
    });
  }
}
