import 'dart:developer';

import 'package:dvt_weather_app/data/local/database/database.dart';
import 'package:dvt_weather_app/data/repositories/dto/current_weather_dto_response.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:dvt_weather_app/data/network/api_provider.dart';
import 'package:dvt_weather_app/data/network/end_points.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository.dart';
import 'package:dvt_weather_app/utils/weather_types.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  ApiProvider _apiProvider;
  WeatherAppDatabase _weatherAppDatabase;

  WeatherRepositoryImpl(this._apiProvider, this._weatherAppDatabase);

  @override
  Future<WeatherModel> getTodayWeather(double? lat, double? long) async {
    try {
      final url = EndPoints.baseUrl +
          'weather?lat=${lat}&units=metric'
              '&lon=${long}'
              '&appid=${EndPoints.appKey}';

      final response = await _apiProvider.get(url);
      final weatherDtoObject = CurrentWeatherDtoResponse.fromJson(response);

      final weatherModel = WeatherModel(
          null,
          weatherDtoObject.main?.tempMax?.toDouble(),
          weatherDtoObject.main?.tempMin?.toDouble(),
          weatherDtoObject.main?.temp?.toDouble(),
          _getWeatherType(weatherDtoObject),
          'current',
          weatherDtoObject.name ?? '',
          DateFormat("dd MMM, yyyy HH:mm a").format(DateTime.now()));

      // delete existing and insert new data
      await _weatherAppDatabase.weatherDao
          .deleteAllRecords('current', 'forecast');
      await _weatherAppDatabase.weatherDao.insertWeatherModel(weatherModel);

      return weatherModel;
    } catch (e) {
      log("---> ${e.toString()}");
      rethrow;
    }
  }

  int _getWeatherType(CurrentWeatherDtoResponse currentWeatherDtoResponse) {
    // if no weather return sunny by default
    if (currentWeatherDtoResponse.weather?.isEmpty == true) {
      return WeatherTypes.sunny.intValue;
    }
    // use first object
    final weather = currentWeatherDtoResponse.weather?[0].main?.toLowerCase();
    if (weather!.contains('sun')) {
      return WeatherTypes.sunny.intValue;
    } else if (weather.contains('rain')) {
      return WeatherTypes.rainy.intValue;
    } else if (weather.contains('cloud')) {
      return WeatherTypes.cloudy.intValue;
    } else {
      return WeatherTypes.sunny.intValue;
    }
  }

  @override
  Future<List<WeatherModel>> getFiveDaysWeather(
      double? lat, double? long) async {
    try {
      // fetch data from api
      final url = EndPoints.baseUrl +
          'forecast?lat=${lat}&units=metric'
              '&lon=${long}'
              '&appid=${EndPoints.appKey}';
      final response = await _apiProvider.get(url);

      final weatherList = response['list']
          .map((element) => CurrentWeatherDtoResponse.fromJson(element))
          .toList();

      // map list to only one result per day
      Map<String, WeatherModel> weatherModelList = {};
      for (var element in weatherList) {
        // format date
        String day = DateFormat("EEEE").format(
            DateTime.fromMillisecondsSinceEpoch(element.dt!.toInt() * 1000));
        // check if date already exists
        if (!weatherModelList.containsKey(day)) {
          final weatherModel = WeatherModel(
              null,
              element.main?.tempMax?.toDouble(),
              element.main?.tempMin?.toDouble(),
              element.main?.temp?.toDouble(),
              _getWeatherType(element),
              'forecast',
              element.name ?? '',
              DateFormat("dd MMM, yyyy HH:mm a").format(DateTime.now()),
              day: day);
          weatherModelList[day] = weatherModel;
        }
      }

      final weatherModels = weatherModelList.values.toList();
      await _weatherAppDatabase.weatherDao.insertWeatherModels(weatherModels);

      // return modified list
      return weatherModelList.values.toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<WeatherModel>?> getCachedForeCastWeather() async {
    try {
      final cacheForecastWeatherModel =
          await _weatherAppDatabase.weatherDao.getWeatherModels('forecast');
      return cacheForecastWeatherModel;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<WeatherModel?> getCachedTodayWeather() async {
    try {
      final cachedCurrentWeatherModel =
          await _weatherAppDatabase.weatherDao.getWeatherModelByTag('current');
      return cachedCurrentWeatherModel;
    } catch (e) {
      return null;
    }
  }

  @override
  Future markWeatherAsFavourite() async {
    try {
      final cachedCurrentWeatherModel =
          await _weatherAppDatabase.weatherDao.getWeatherModelByTag('current');

      // check if it already exists
      final existingSavedWeatherModel = await _weatherAppDatabase.weatherDao
          .getWeatherByLocationName(
              cachedCurrentWeatherModel!.locationName!, 'favourite');
      if (existingSavedWeatherModel != null) {
        // update it
        existingSavedWeatherModel.max = cachedCurrentWeatherModel.max;
        existingSavedWeatherModel.min = cachedCurrentWeatherModel.min;
        existingSavedWeatherModel.temp = cachedCurrentWeatherModel.temp;
        existingSavedWeatherModel.savedDate =
            DateFormat("dd MMM, yyyy HH:mm a").format(DateTime.now());
        await _weatherAppDatabase.weatherDao
            .updateWeatherModel(existingSavedWeatherModel);
      } else {
        // use tag - favourite
        final weatherModel = WeatherModel(
            null,
            cachedCurrentWeatherModel.max,
            cachedCurrentWeatherModel.min,
            cachedCurrentWeatherModel.temp,
            cachedCurrentWeatherModel.weather,
            'favourite',
            cachedCurrentWeatherModel.locationName ?? '',
            DateFormat("dd MMM, yyyy HH:mm a").format(DateTime.now()));

        await _weatherAppDatabase.weatherDao.insertWeatherModel(weatherModel);
      }
    } catch (e) {
      log('---> ${e}');
      rethrow;
    }
  }

  @override
  Future<List<WeatherModel>?> getAllFavWeather() async {
    try {
      final favs =
          await _weatherAppDatabase.weatherDao.getWeatherModels('favourite');
      return favs;
    } catch (e) {
      return [];
    }
  }
}
