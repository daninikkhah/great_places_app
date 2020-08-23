import 'package:flutter/foundation.dart';
import 'dart:io';
import './place_location.dart';

class Place {
  Place(
      {@required this.id,
      @required this.title,
      @required this.image,
      this.location});
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;
}
