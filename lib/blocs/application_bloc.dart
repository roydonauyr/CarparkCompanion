import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import '/services/geolocator_service.dart';
import: 'package:places_service/place_service.dart'

class Applicationbloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();

  //Variables
  Position currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }
}

setCurrentLocation() async {
  currentLocation = await geoLocatorService.getCurrentLocation();
  notifyListeners();
}
