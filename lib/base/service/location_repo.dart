import '../../exports.dart';
import '../../base/globals/global.dart' as globals;

class LocationRepository {
  final ApiService _apiService =
      ApiService('https://657025ee09586eff6640c8d2.mockapi.io/');

  Future<List<CurrentLocationModel>> fetchCurrentLocation() async {
    final data = await _apiService.get('currentLocation');
    return List<CurrentLocationModel>.from(
        data.map((item) => CurrentLocationModel.fromJson(item)));
  }

  Future<HistoryLocationModel> fetchLocationHistory() async {
    final data =
        await _apiService.get('locationHistory/${globals.selected!.id}');
    return HistoryLocationModel.fromJson(data);
  }
}
