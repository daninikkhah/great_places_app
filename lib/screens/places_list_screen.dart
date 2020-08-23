import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/places.dart';
import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  static const String route = 'PlacesListScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.route),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<Places>(context, listen: false).fetchPlaces(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<Places>(
                  child: Center(
                    child: const Text('No image yet'),
                  ),
                  builder: (context, places, child) =>
                      places.placesList.length < 1
                          ? child
                          : ListView.builder(
                              itemCount: places.placesList.length,
                              itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        FileImage(places.placesList[i].image),
                                  ),
                                  title: Text(places.placesList[i].title),
                                ),
                              ),
                            ),
                ),
        ),
      ),
    );
  }
}
