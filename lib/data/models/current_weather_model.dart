import 'package:dvt_weather_app/utils/weather_types.dart';

class CurrentWeatherModel {
  WeatherTypes? weatherType;
  double? temp;
  double? min;
  double? max;

  CurrentWeatherModel(this.max, this.min, this.temp, this.weatherType) {}
}
