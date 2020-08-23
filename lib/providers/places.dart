import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';
import '../controllers/database.dart';

class Places with ChangeNotifier {
  List<Place> _placesList = [];
  List<Place> get placesList => [..._placesList];

  void addPlace({File image, String title}) {
    DateTime time = DateTime.now();
    _placesList.add(Place(
      id: time.toString(),
      title: title,
      image: image,
    ));
    notifyListeners();
    Db.insert(table: 'user_places', data: {
      'id': time.toString(),
      'title': title,
      'image': image.path,
    });
  }

  Future<void> fetchPlaces() async {
    final List<Map<String, dynamic>> dbData = await Db.getData('user_places');

    _placesList = dbData
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
        )
        .toList();

    notifyListeners();
  }
}
