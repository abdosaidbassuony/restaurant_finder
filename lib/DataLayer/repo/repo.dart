import 'package:get_it/get_it.dart';
import 'package:restaurant_finder/DataLayer/network/api_client.dart';
import 'package:restaurant_finder/DataLayer/model/location_model/response.dart';
import 'package:restaurant_finder/DataLayer/model/restaurant_model/restaurant.dart';
class Repo {
  // final _apiClient = GetIt.instance.get<ApiClient>();
  final ApiClient _apiClient;

  Repo(this._apiClient);

  Future<LocationResponse> getLocations(String query) async {
    try{
      return await _apiClient.fetchLocations(query: query);
    }catch(e){
      print(e);
    }
  }

  Future<List<Restaurant>> getRestaurants() async {
    return await _apiClient.fetchRestaurants();
  }
// @override
// Future<List<Location>> fetchLocations(String query) {
//
// }
//
// @override
// Future<List<Restaurant>> fetchRestaurants({int locationId, String locationType, String query, int count = 10}) {
//   throw UnimplementedError();
// }
}
