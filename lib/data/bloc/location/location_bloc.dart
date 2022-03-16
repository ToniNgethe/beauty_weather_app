import 'package:dvt_weather_app/data/bloc/location/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocationBloc extends Cubit<LocationState> {
  LocationBloc() : super(const LocationState.init());

  void fetchUserCurrentLocation() async {
    try {
      emit(const LocationState.loading());
      // Test if location services are enabled.
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        throw 'location services disabled! kindly enable them to continue using the app';
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied';
        }
      }
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        throw 'Location permissions are permanently denied, we cannot request permissions';
      }
      final location = await Geolocator.getCurrentPosition();
      emit(LocationState.locationUpdate(location));
    } catch (e) {
      emit(LocationState.error(e.toString()));
    }
  }
}
