part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}


final class HistoryLocationLoading extends HistoryState {
}

final class HistoryLocationLoaded extends HistoryState {

  final HistoryLocationModel data;

  HistoryLocationLoaded(this.data);
}


final class HistoryLocationFailure extends HistoryState {
  final String message;

  HistoryLocationFailure(this.message);
}