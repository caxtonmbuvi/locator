part of 'current_location_cubit.dart';

@immutable
sealed class CurrentLocationState {
  // const CurrentLocationState();
}

final class CurrentLocationInitial extends CurrentLocationState {
  // const CurrentLocationInitial();
}

final class CurrentLocationLoading extends CurrentLocationState {
  // const CurrentLocationLoading();
}

final class CurrentLocationLoaded extends CurrentLocationState {

  final List<CurrentLocationModel> data;
  // final List<CurrentLocationModel> filtereddata;

  CurrentLocationLoaded(this.data);
}


final class CurrentLocationFailure extends CurrentLocationState {
  final String message;

  CurrentLocationFailure(this.message);
}