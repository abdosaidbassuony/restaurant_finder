import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:restaurant_finder/DataLayer/model/location_model/location.dart';
import 'package:restaurant_finder/DataLayer/repo/repo.dart';
import 'package:restaurant_finder/base/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LocationBloc implements BaseBloc {
  final repo = GetIt.instance.get<Repo>();
  Location _location;

  Location get selectedLocation => _location;

  final _locationController = BehaviorSubject<Location>();

  final _locationListController = BehaviorSubject<List<Location>>();

  Stream<Location> get streamLocation => _locationController.stream;

  Stream<List<Location>> get streamLocationList =>
      _locationListController.stream;

  Future<Location> selectLocation(Location location) async {
    _locationController.value = location;
    _locationController.sink.add(location);
  }

  void getLocationListFromQuery(String query) async {
    final locationListFromQuery = await repo.getLocations(query);
    _locationListController.sink.add(locationListFromQuery.locationList);
  }

  @override
  void dispose() {
    _locationController.close();
    _locationListController.close();
  }
}
