import 'package:flutter/material.dart';
import 'package:restaurant_finder/UI/location_screen/location_screen.dart';
import 'package:restaurant_finder/UI/restaurant_screan/restaurant_screen.dart';

class Routes {
  static final Map<String, WidgetBuilder> _routes = {
    '/locationScreen': (context) => LocationScreen(),
    '/restaurantScreen': (context) => RestaurantScreen()
  };

  static Map<String, WidgetBuilder> getAll() => _routes;

  static WidgetBuilder getRouteByName(String name) {
    if (_routes.containsKey(name) == false) {
      return _routes[RouteList.locationScreen];
    }
    return _routes[name];
  }
}

class RouteList {
  static const locationScreen = '/locationScreen';
  static const restaurantScreen = '/restaurantScreen';
}
