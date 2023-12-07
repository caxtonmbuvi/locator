part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class MapLoading extends MapState {}

final class Maploaded extends MapState {
  final GoogleMapController mapController;
  final Set<Marker> markers;

  Maploaded(this.mapController, this.markers);
}

final class MapError extends MapState {
  final String message;

  MapError(this.message);
}
