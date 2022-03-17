// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/bloc/location/location_bloc.dart' as _i8;
import '../data/bloc/location/user_location.dart' as _i4;
import '../data/bloc/location/user_location_impl.dart' as _i5;
import '../data/bloc/weather/weather_bloc.dart' as _i11;
import '../data/local/database/database.dart' as _i6;
import '../data/local/database/database_module.dart' as _i13;
import '../data/network/api_provider.dart' as _i7;
import '../data/network/dio_client.dart' as _i12;
import '../data/repositories/weather_repository.dart' as _i9;
import '../data/repositories/weather_repository_impl.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioClient = _$DioClient();
  final databaseModule = _$DatabaseModule();
  gh.lazySingleton<_i3.Dio>(() => dioClient.dio);
  gh.factory<_i4.UserLocations>(() => _i5.UserLocationImpl());
  await gh.factoryAsync<_i6.WeatherAppDatabase>(() => databaseModule.database,
      preResolve: true);
  gh.singleton<_i7.ApiProvider>(_i7.ApiProvider(get<_i3.Dio>()));
  gh.factory<_i8.LocationBloc>(
      () => _i8.LocationBloc(get<_i4.UserLocations>()));
  gh.factory<_i9.WeatherRepository>(() => _i10.WeatherRepositoryImpl(
      get<_i7.ApiProvider>(), get<_i6.WeatherAppDatabase>()));
  gh.factory<_i11.WeatherBloc>(
      () => _i11.WeatherBloc(get<_i9.WeatherRepository>()));
  return get;
}

class _$DioClient extends _i12.DioClient {}

class _$DatabaseModule extends _i13.DatabaseModule {}
