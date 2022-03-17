import 'package:bloc_test/bloc_test.dart';
import 'package:dvt_weather_app/data/bloc/location/user_location.dart';
import 'package:dvt_weather_app/data/bloc/location/location_bloc.dart';
import 'package:dvt_weather_app/data/bloc/location/location_state.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fake_user_location.dart';
import 'location_bloc_test.mocks.dart';

@GenerateMocks([FakeUserLocation])
void main() {
  late UserLocations userLocation;
  late LocationBloc locationBloc;

  setUp(() {
    userLocation = MockFakeUserLocation();
    locationBloc = LocationBloc(userLocation);
  });

  tearDown(() {
    locationBloc.close();
  });

  blocTest(
      'emit [LocationState.loading()] and LocationState.locationUpdate() '
      'when requesting user location is a success',
      build: () => locationBloc,
      act: (LocationBloc locationBloc) {
        when(userLocation.isLocationEnabled()).thenAnswer((_) async => true);
        when(userLocation.checkPermission())
            .thenAnswer((_) async => LocationPermission.always);
        when(userLocation.getCurrentPosition()).thenAnswer((_) async =>
            Position(
                longitude: 0.001,
                latitude: 1.00,
                timestamp: DateTime.now(),
                accuracy: 0.0,
                altitude: 122,
                heading: 2.1,
                speed: 23,
                speedAccuracy: 1));
        return locationBloc.fetchUserCurrentLocation();
      },
      expect: () => [isA<LocationLoadingState>(), isA<LocationPositionState>()],
      verify: (_) {
        verify(userLocation.isLocationEnabled()).called(1);
        verify(userLocation.checkPermission()).called(1);
        verify(userLocation.getCurrentPosition()).called(1);
      });

  blocTest(
      'emit [LocationState.loading()] and LocationState.error() '
      'when requesting user location services is disabled',
      build: () => locationBloc,
      act: (LocationBloc locationBloc) {
        when(userLocation.isLocationEnabled()).thenAnswer((_) async => false);
        when(userLocation.checkPermission())
            .thenAnswer((_) async => LocationPermission.always);
        when(userLocation.getCurrentPosition()).thenAnswer((_) async =>
            Position(
                longitude: 0.001,
                latitude: 1.00,
                timestamp: DateTime.now(),
                accuracy: 0.0,
                altitude: 122,
                heading: 2.1,
                speed: 23,
                speedAccuracy: 1));
        return locationBloc.fetchUserCurrentLocation();
      },
      expect: () => [isA<LocationLoadingState>(), isA<LocationErrorState>()],
      verify: (_) {
        verify(userLocation.isLocationEnabled()).called(1);
        verifyNever(userLocation.checkPermission());
        verifyNever(userLocation.getCurrentPosition());
      });

  blocTest(
      'emit [LocationState.loading()] and LocationState.error() '
      'when requesting user denies app to get location',
      build: () => locationBloc,
      act: (LocationBloc locationBloc) {
        when(userLocation.isLocationEnabled()).thenAnswer((_) async => true);
        when(userLocation.checkPermission())
            .thenAnswer((_) async => LocationPermission.denied);
        when(userLocation.getCurrentPosition()).thenAnswer((_) async =>
            Position(
                longitude: 0.001,
                latitude: 1.00,
                timestamp: DateTime.now(),
                accuracy: 0.0,
                altitude: 122,
                heading: 2.1,
                speed: 23,
                speedAccuracy: 1));
        return locationBloc.fetchUserCurrentLocation();
      },
      expect: () => [isA<LocationLoadingState>(), isA<LocationErrorState>()],
      verify: (_) {
        verify(userLocation.isLocationEnabled()).called(1);
        verify(userLocation.checkPermission()).called(1);
        verifyNever(userLocation.getCurrentPosition());
      });

  blocTest(
      'emit [LocationState.loading()] and LocationState.error() '
      'when requesting user denies getting the app location forever',
      build: () => locationBloc,
      act: (LocationBloc locationBloc) {
        when(userLocation.isLocationEnabled()).thenAnswer((_) async => true);
        when(userLocation.checkPermission())
            .thenAnswer((_) async => LocationPermission.denied);
        when(userLocation.getCurrentPosition()).thenAnswer((_) async =>
            Position(
                longitude: 0.001,
                latitude: 1.00,
                timestamp: DateTime.now(),
                accuracy: 0.0,
                altitude: 122,
                heading: 2.1,
                speed: 23,
                speedAccuracy: 1));
        return locationBloc.fetchUserCurrentLocation();
      },
      expect: () => [isA<LocationLoadingState>(), isA<LocationErrorState>()],
      verify: (_) {
        verify(userLocation.isLocationEnabled()).called(1);
        verify(userLocation.checkPermission()).called(1);
        verifyNever(userLocation.getCurrentPosition());
      });

  blocTest(
      'check if app requests for permission again if user at first denies access',
      build: () => locationBloc,
      act: (LocationBloc locationBloc) {
        when(userLocation.isLocationEnabled()).thenAnswer((_) async => true);
        when(userLocation.checkPermission())
            .thenAnswer((_) async => LocationPermission.denied);
        when(userLocation.requestPermission())
            .thenAnswer((_) async => LocationPermission.always);
        when(userLocation.getCurrentPosition()).thenAnswer((_) async =>
            Position(
                longitude: 0.001,
                latitude: 1.00,
                timestamp: DateTime.now(),
                accuracy: 0.0,
                altitude: 122,
                heading: 2.1,
                speed: 23,
                speedAccuracy: 1));
        return locationBloc.fetchUserCurrentLocation();
      },
      expect: () => [isA<LocationLoadingState>(), isA<LocationPositionState>()],
      verify: (_) {
        verify(userLocation.isLocationEnabled()).called(1);
        verify(userLocation.checkPermission()).called(1);
        verify(userLocation.requestPermission()).called(1);
        verify(userLocation.getCurrentPosition()).called(1);
      });
}
