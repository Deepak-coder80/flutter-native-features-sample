import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GratePlace with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: PlaceLocation(
        latitude: 57.0023,
        longitude: 34.0035,
      ),
      image: image,
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
