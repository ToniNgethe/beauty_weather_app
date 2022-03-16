import 'package:dvt_weather_app/data/models/current_weather_model.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherModel> getTodayWeather( double? lat, double? long);
}