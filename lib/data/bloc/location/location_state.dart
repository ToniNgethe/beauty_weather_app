
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.init() = LocationInitState;
  const factory LocationState.error( String message )   = LocationErrorState;
  const factory LocationState.locationUpdate( Position position )   = LocationPositionState;
  const factory LocationState.loading()   = LocationLoadingState;
}