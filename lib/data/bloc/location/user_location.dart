import 'package:geolocator/geolocator.dart';

abstract class UserLocations {
  Future<bool> isLocationEnabled();

  Future<LocationPermission> checkPermission();

  Future<LocationPermission> requestPermission();

  Future<Position> getCurrentPosition();
}
