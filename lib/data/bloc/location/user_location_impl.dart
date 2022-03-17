import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import 'user_location.dart';

@Injectable(as: UserLocations)
class UserLocationImpl implements UserLocations {
  UserLocationImpl();

  @override
  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  @override
  Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<bool> isLocationEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }
}
