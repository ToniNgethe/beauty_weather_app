enum WeatherTypes { cloudy, rainy, sunny }

extension WeatherTypesDesc on WeatherTypes {
  String get desc {
    switch (this) {
      case WeatherTypes.cloudy:
        return "Cloudy";
      case WeatherTypes.rainy:
        return "Rainy";
      case WeatherTypes.sunny:
        return "Sunny";
    }
  }

  int get intValue {
    switch (this) {
      case WeatherTypes.cloudy:
        return 2;
      case WeatherTypes.rainy:
        return 1;
      case WeatherTypes.sunny:
        return 3;
      default:
        return 1;
    }
  }
}
