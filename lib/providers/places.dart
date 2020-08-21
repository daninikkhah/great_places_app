import 'package:flutter/foundation.dart';
import '../models/place.dart';

class Places with ChangeNotifier {
  List<Place> _placesList = [];
  List<Place> get placesList => [..._placesList];
}
