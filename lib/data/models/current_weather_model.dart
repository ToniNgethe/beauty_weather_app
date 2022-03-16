import 'package:dvt_weather_app/utils/app_colors.dart';
import 'package:dvt_weather_app/utils/assets.dart';
import 'package:dvt_weather_app/utils/weather_types.dart';
import 'package:flutter/cupertino.dart';

class WeatherModel {
  WeatherTypes? weatherType;
  double? temp;
  double? min;
  double? max;
  String? day;

  WeatherModel(this.max, this.min, this.temp, this.weatherType,{this.day}) {}
}

extension WeatherAssets on WeatherModel {
  String? get asset {
    switch (weatherType) {
      case WeatherTypes.rainy:
        return Assets.rainy;
      case WeatherTypes.cloudy:
        return Assets.cloudy;
      case WeatherTypes.sunny:
        return Assets.sunny;
      default: return null;
    }
  }

  String get icon {
    switch (weatherType) {
      case WeatherTypes.rainy:
        return Assets.rain;
      case WeatherTypes.cloudy:
        return Assets.partlySunny;
      case WeatherTypes.sunny:
        return Assets.clear;
      default: return '';
    }
  }

  Color? get color {
    switch (weatherType) {
      case WeatherTypes.rainy:
        return AppColors.rainy;
      case WeatherTypes.cloudy:
        return AppColors.cloudy;
      case WeatherTypes.sunny:
        return AppColors.sunny;
      default: return null;
    }
  }
}
