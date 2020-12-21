import 'package:flutter/material.dart';
import 'package:restaurant_finder/UI/location_screen/location_bloc.dart';
import 'package:restaurant_finder/UI/restaurant_screan/restaurant_screen.dart';
import 'package:restaurant_finder/base/bloc_provider.dart';

import 'file:///C:/project/Restaurant-Finder/restaurant-finder-starter/lib/UI/location_screen/location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of<LocationBloc>(context).streamLocation,
      builder: (context, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationScreen();
        }
        return RestaurantScreen(location: location);
      },
    );
  }
}
