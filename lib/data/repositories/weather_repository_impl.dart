import 'package:dvt_weather_app/data/models/current_weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> getTodayWeather( double? lat, double? long);
  Future<List<WeatherModel>> getFiveDaysWeather( double? lat, double? lon );
}