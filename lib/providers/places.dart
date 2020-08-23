import 'dart:io';
import 'package:flutter/foundation.dart';
import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> _placesList = [];
  List<Place> get placesList => [..._placesList];

  void addPlace({File image, String title}) {
    _placesList.add(Place(
        id: DateTime.now().toString(),
        title: title,
        image: image,
        location: null));
    notifyListeners();
  }
}
