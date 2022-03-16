import 'package:dvt_weather_app/data/repositories/dto/current_weather_dto_response.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:dvt_weather_app/data/network/api_provider.dart';
import 'package:dvt_weather_app/data/network/end_points.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository_impl.dart';
import 'package:dvt_weather_app/utils/weather_types.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  ApiProvider _apiProvider;

  WeatherRepositoryImpl(this._apiProvider);

  @override
  Future<WeatherModel> getTodayWeather(double? lat, double? long) async {
    try {
      final url = EndPoints.baseUrl +
          'weather?lat=${lat}&units=metric'
              '&lon=${long}'
              '&appid=${EndPoints.appKey}';

      final response = await _apiProvider.get(url);
      final weatherDtoObject = CurrentWeatherDtoResponse.fromJson(response);

      return WeatherModel(
          null,
          weatherDtoObject.main?.tempMax?.toDouble(),
          weatherDtoObject.main?.tempMin?.toDouble(),
          weatherDtoObject.main?.temp?.toDouble(),
          _getWeatherType(weatherDtoObject));
    } catch (e) {
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
              day: day);
          weatherModelList[day] = weatherModel;
        }
      }

      // return modified list
      return weatherModelList.values.toList();
    } catch (e) {
      rethrow;
    }
  }
}
