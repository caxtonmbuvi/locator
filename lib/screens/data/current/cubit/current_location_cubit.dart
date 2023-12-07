
import '../../../../exports.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  final LocationRepository _locationRepository;
  CurrentLocationCubit(this._locationRepository)
      : super(CurrentLocationInitial());

  Future<void> getCurrentLocations() async {
    try {
      emit(CurrentLocationLoading());
      final locations = await _locationRepository.fetchCurrentLocation();
      emit(CurrentLocationLoaded(locations));
    } catch (e) {
      emit(CurrentLocationFailure(e.toString()));
    }
  }
}
