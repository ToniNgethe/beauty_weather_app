import 'package:dvt_weather_app/utils/app_colors.dart';
import 'package:dvt_weather_app/utils/assets.dart';
import 'package:dvt_weather_app/utils/weather_types.dart';
import 'package:floor/floor.dart';
import 'package:flutter/cupertino.dart';

@entity
class WeatherModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  int? weather;
  double? temp;
  double? min;
  double? max;
  String? day;
  String? savedDate;
  String? tag;
  String? locationName;

  WeatherModel(this.id, this.max, this.min, this.temp, this.weather, this.tag,
      this.locationName,
      this.savedDate,
      {this.day}) {}
}

extension WeatherAssets on WeatherModel {
  WeatherTypes get weatherType {
    switch (weather) {
      case 1:
        return WeatherTypes.rainy;
      case 2:
        return WeatherTypes.cloudy;
      case 3:
        return WeatherTypes.sunny;
      default:
        return WeatherTypes.sunny;
    }
  }

  String? get asset {
    switch (weatherType) {
      case WeatherTypes.rainy:
        return Assets.rainy;
      case WeatherTypes.cloudy:
        return Assets.cloudy;
      case WeatherTypes.sunny:
        return Assets.sunny;
      default:
        return null;
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
      default:
        return '';
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
      default:
        return null;
    }
  }
}
