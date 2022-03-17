import 'package:dvt_weather_app/data/bloc/location/user_location.dart';
import 'package:geolocator_platform_interface/src/enums/location_permission.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';

class FakeUserLocation implements UserLocations {
  @override
  Future<LocationPermission> checkPermission() {
    // TODO: implement checkPermission
    throw UnimplementedError();
  }

  @override
  Future<Position> getCurrentPosition() {
    // TODO: implement getCurrentPosition
    throw UnimplementedError();
  }

  @override
  Future<bool> isLocationEnabled() {
    // TODO: implement isLocationEnabled
    throw UnimplementedError();
  }

  @override
  Future<LocationPermission> requestPermission() {
    // TODO: implement requestPermission
    throw UnimplementedError();
  }

}