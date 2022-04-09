import 'package:geolocator/geolocator.dart';

/// Geolocator class which returns the current position of the user
class GeolocatorService {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
