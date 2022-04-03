import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

// class GeolocatorService {
//   final Geolocator geo = Geolocator();

//   Stream<Position> getCurrentLocation() {
//     var locationOptions =
//         LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
//     return geo.getPositionStream(locationOptions);
//   }
  
//   Future<Position> getInitialLocation() async {
//     return geo.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   }