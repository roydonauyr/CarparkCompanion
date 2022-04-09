import 'package:flutter_application_2/Database/carparkDetail.dart';
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

/// List of filtered carpark objects
List<CarparkDetail> filterDistance(
    List<CarparkDetail> carparkObjects, LatLng lastMapPosition, double value) {
  List<CarparkDetail> filteredCarparks = <CarparkDetail>[];
  for (int i = 0; i < carparkObjects.length; i++) {
    if (calculateDistance(lastMapPosition.latitude, lastMapPosition.longitude,
            carparkObjects[i].lat, carparkObjects[i].long) <=
        value) {
      filteredCarparks.add(carparkObjects[i]);
    }
  }
  print(filteredCarparks.toString());
  return filteredCarparks;
}

///Function to calculate whether point is within radius
double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 1000 * 12742 * asin(sqrt(a));
}
