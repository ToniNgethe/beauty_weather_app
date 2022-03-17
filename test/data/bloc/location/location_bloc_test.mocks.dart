// Mocks generated by Mockito 5.1.0 from annotations
// in dvt_weather_app/test/data/bloc/location/location_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:geolocator_platform_interface/src/enums/location_permission.dart'
    as _i5;
import 'package:geolocator_platform_interface/src/models/position.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'fake_user_location.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakePosition_0 extends _i1.Fake implements _i2.Position {}

/// A class which mocks [FakeUserLocation].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeUserLocation extends _i1.Mock implements _i3.FakeUserLocation {
  MockFakeUserLocation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i5.LocationPermission> checkPermission() =>
      (super.noSuchMethod(Invocation.method(#checkPermission, []),
              returnValue: Future<_i5.LocationPermission>.value(
                  _i5.LocationPermission.denied))
          as _i4.Future<_i5.LocationPermission>);
  @override
  _i4.Future<_i2.Position> getCurrentPosition() =>
      (super.noSuchMethod(Invocation.method(#getCurrentPosition, []),
              returnValue: Future<_i2.Position>.value(_FakePosition_0()))
          as _i4.Future<_i2.Position>);
  @override
  _i4.Future<bool> isLocationEnabled() =>
      (super.noSuchMethod(Invocation.method(#isLocationEnabled, []),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<_i5.LocationPermission> requestPermission() =>
      (super.noSuchMethod(Invocation.method(#requestPermission, []),
              returnValue: Future<_i5.LocationPermission>.value(
                  _i5.LocationPermission.denied))
          as _i4.Future<_i5.LocationPermission>);
}
