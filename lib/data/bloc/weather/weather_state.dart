import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.init() = WeatherInitState;

  const factory WeatherState.loading() = WeatherLoadingState;

  const factory WeatherState.error(String message) = WeatherErrorState;

  const factory WeatherState.todayWeather(WeatherModel currentWeatherModel) =
      WeatherTodayState;

  const factory WeatherState.forecastWeather(
      List<WeatherModel>? forecastWeatherModel) = WeatherForecastState;

  const factory WeatherState.notifyUser(String message) = WeatherNotifyState;
}
