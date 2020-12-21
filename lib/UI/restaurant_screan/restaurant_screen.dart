import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_finder/DataLayer/model/location_model/location.dart';
import 'package:restaurant_finder/UI/restaurant_screan/restaurant_tile.dart';
import 'package:restaurant_finder/UI/restaurant_screan/restuarant_bloc.dart';
import 'package:restaurant_finder/base/bloc_provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Location location;

  RestaurantScreen({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
      ),
      body: _buildSearch(context),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = RestaurantBloc(location: location);
    return BlocProvider(
        bloc: bloc,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'What do you want to eat?'),
                onChanged: (query) => bloc.restaurantListFromQuery(query),
              ),
            ),
            Expanded(
              child: _buildStreamBuilder(bloc),
            )
          ],
        ));
  }

  Widget _buildStreamBuilder(RestaurantBloc bloc) {
    return StreamBuilder(
      stream: bloc.streamRestaurantList,
      builder: (context, snapshot) {
        final results = snapshot.data;
        if (results == null) {
          return Center(child: Text('Enter a restaurant name or cuisine type'));
        }

        if (results.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final restaurant = results[index];
        return RestaurantTile(restaurant: restaurant);
      },
    );
  }
}
