import 'package:flutter/material.dart';
import 'package:restaurant_finder/DataLayer/model/location_model/location.dart';
import 'package:restaurant_finder/UI/location_screen/location_bloc.dart';
import 'package:restaurant_finder/UI/restaurant_screan/restaurant_screen.dart';
import 'package:restaurant_finder/base/bloc_provider.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;

  const LocationScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locationBloc = LocationBloc();
    return BlocProvider<LocationBloc>(
        bloc: locationBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Where do you want to eat?"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a location'),
                  onChanged: (query) =>
                      locationBloc.getLocationListFromQuery(query),
                ),
              ),
              Expanded(
                child: _buildResults(locationBloc),
              )
            ],
          ),
        ));
  }

  Widget _buildResults([LocationBloc locationBloc]) {
    return StreamBuilder<List<Location>>(
        stream: locationBloc.streamLocationList,
        builder: (context, snapshot) {
          final result = snapshot.data;
          if (result == null) {
            return Center(child: Text('Enter a location'));
          }
          if (result.isEmpty) {
            return Center(child: Text('No Results'));
          }

          return _buildScreenResult(result);
        });
  }

  Widget _buildScreenResult([List<Location> result]) {
    return ListView.separated(
      itemCount: result.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final location = result[index];
        return ListTile(
          title: Text(location.title),
          onTap: () {
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.selectLocation(location);
            print(location.title);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RestaurantScreen(
                    location: location,
                  ),
                ));
          },
        );
      },
    );
  }
}
