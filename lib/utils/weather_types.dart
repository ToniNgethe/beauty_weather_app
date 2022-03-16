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
}
