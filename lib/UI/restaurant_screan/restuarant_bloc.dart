import 'dart:async';
import 'package:restaurant_finder/DataLayer/model/restaurant_model/restaurant.dart';
import 'package:restaurant_finder/DataLayer/network/api_client.dart';
import 'package:restaurant_finder/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:restaurant_finder/DataLayer/model/location_model/location.dart';

class RestaurantBloc extends BaseBloc {
  final Location location;

  RestaurantBloc({this.location});

  final _restaurantListController = BehaviorSubject<List<Restaurant>>();

  Stream<List<Restaurant>> get streamRestaurantList =>
      _restaurantListController.stream;

  void restaurantListFromQuery(String query) async {
    // _restaurantListController.sink.add(restaurantFromQuery);
  }

  @override
  void dispose() {
    _restaurantListController.close();
  }
}
