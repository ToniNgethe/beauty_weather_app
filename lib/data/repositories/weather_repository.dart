import 'package:dvt_weather_app/data/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel?> getCachedTodayWeather();

  Future<List<WeatherModel>?> getCachedForeCastWeather();

  Future<WeatherModel> getTodayWeather(double? lat, double? long);

  Future<List<WeatherModel>> getFiveDaysWeather(double? lat, double? lon);

  Future markWeatherAsFavourite();

  Future<List<WeatherModel>?> getAllFavWeather();
}
