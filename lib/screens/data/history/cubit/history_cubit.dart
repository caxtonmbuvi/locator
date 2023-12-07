
import '../../../../exports.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final LocationRepository _locationRepository;
  HistoryCubit(this._locationRepository) : super(HistoryInitial());
  
  Future<void> getPreviousLocations() async {
    try {
      emit(HistoryLocationLoading());
      final locations = await _locationRepository.fetchLocationHistory();
      emit(HistoryLocationLoaded(locations));
    } catch (e) {
      emit(HistoryLocationFailure(e.toString()));
    }
  }
}
