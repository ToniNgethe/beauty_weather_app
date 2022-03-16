// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/bloc/location/location_bloc.dart' as _i4;
import '../data/bloc/weather/weather_bloc.dart' as _i8;
import '../data/network/api_provider.dart' as _i5;
import '../data/network/dio_client.dart' as _i9;
import '../data/repositories/weather_repository.dart' as _i7;
import '../data/repositories/weather_repository_impl.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioClient = _$DioClient();
  gh.lazySingleton<_i3.Dio>(() => dioClient.dio);
  gh.factory<_i4.LocationBloc>(() => _i4.LocationBloc());
  gh.singleton<_i5.ApiProvider>(_i5.ApiProvider(get<_i3.Dio>()));
  gh.factory<_i6.WeatherRepository>(
      () => _i7.WeatherRepositoryImpl(get<_i5.ApiProvider>()));
  gh.factory<_i8.WeatherBloc>(
      () => _i8.WeatherBloc(get<_i6.WeatherRepository>()));
  return get;
}

class _$DioClient extends _i9.DioClient {}
