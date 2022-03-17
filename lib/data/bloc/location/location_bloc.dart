import 'package:dvt_weather_app/data/bloc/location/user_location.dart';
import 'package:dvt_weather_app/data/bloc/location/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocationBloc extends Cubit<LocationState> {
  final UserLocations _userLocation;

  LocationBloc(this._userLocation) : super(const LocationState.init());

  void fetchUserCurrentLocation() async {
    try {
      emit(const LocationState.loading());
      // Test if location services are enabled.
      bool serviceEnabled = await _userLocation.isLocationEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        throw 'location services disabled! kindly enable them to continue using the app';
      }
      LocationPermission permission = await _userLocation.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await _userLocation.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        throw 'Location permissions are permanently denied, we cannot request permissions';
      }
      final location = await _userLocation.getCurrentPosition();
      emit(LocationState.locationUpdate(location));
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }
}
