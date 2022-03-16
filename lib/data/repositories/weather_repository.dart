import 'package:dvt_weather_app/data/models/current_weather_dto_response.dart';
import 'package:dvt_weather_app/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/data/network/api_provider.dart';
import 'package:dvt_weather_app/data/network/end_points.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository_impl.dart';
import 'package:dvt_weather_app/utils/weather_types.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  ApiProvider _apiProvider;

  WeatherRepositoryImpl(this._apiProvider);

  @override
  Future<CurrentWeatherModel> getTodayWeather(double lat, double long) async {
    try {
      final url = EndPoints.baseUrl +
          'weather?lat=${lat}'
              '&lon=${long}'
              '&appid=${EndPoints.appKey}';

      final response = await _apiProvider.get(url);
      final weatherDtoObject = CurrentWeatherDtoResponse.fromJson(response);

      return CurrentWeatherModel(
          weatherDtoObject.main?.tempMax,
          weatherDtoObject.main?.tempMin,
          weatherDtoObject.main?.temp,
          _getWeatherType(weatherDtoObject));
    } catch (e) {
      rethrow;
    }
  }

  WeatherTypes _getWeatherType(
      CurrentWeatherDtoResponse currentWeatherDtoResponse) {
    // if no weather return sunny by default
    if (currentWeatherDtoResponse.weather?.isEmpty == true) {
      return WeatherTypes.sunny;
    }
    // use first object
    final weather = currentWeatherDtoResponse.weather?[0].main?.toLowerCase();
    if (weather!.contains('sun')) {
      return WeatherTypes.sunny;
    } else if (weather.contains('rain')) {
      return WeatherTypes.rainy;
    } else if (weather.contains('cloud')) {
      return WeatherTypes.cloudy;
    } else {
      return WeatherTypes.sunny;
    }
  }
}
