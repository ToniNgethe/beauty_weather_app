import 'dart:developer';

import 'package:dvt_weather_app/data/bloc/weather/weather_state.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherBloc extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(const WeatherState.init());

  void fetchWeatherInfo(double? lat, double? long) async {
    try {
      emit(const WeatherState.loading());
      // check if there is any cached data
      final cachedCurrent = await _weatherRepository.getCachedTodayWeather();
      if (cachedCurrent != null) emit(WeatherState.todayWeather(cachedCurrent));
      // make network call
      final response = await _weatherRepository.getTodayWeather(lat, long);
      // // display fresh data
      emit(WeatherState.todayWeather(response));
    } catch (e) {
      // in case of an error display cached data
      final cachedCurrent = await _weatherRepository.getCachedTodayWeather();
      if (cachedCurrent != null) {
        emit(WeatherState.todayWeather(cachedCurrent));
      } else {
        emit(const WeatherState.error("Unable to fetch today's weather"));
      }
    }
  }

  void fetchForecastWeather(double? lat, double? long) async {
    try {
      emit(const WeatherState.loading());
      final cachedForecast =
          await _weatherRepository.getCachedForeCastWeather();
      if (cachedForecast!.isNotEmpty) {
        emit(WeatherState.forecastWeather(cachedForecast));
      }
      final response = await _weatherRepository.getFiveDaysWeather(lat, long);
      emit(WeatherState.forecastWeather(response));
    } catch (e) {
      // in case of an error display cached data
      final cachedForecast =
          await _weatherRepository.getCachedForeCastWeather();
      if (cachedForecast!.isNotEmpty) {
        emit(WeatherState.forecastWeather(cachedForecast));
      } else {
        emit(const WeatherState.error("Unable to fetch today's weather"));
      }
    }
  }

  void markWeatherAsFavourite() async {
    try {
      emit(const WeatherState.loading());
      await _weatherRepository.markWeatherAsFavourite();
      emit(const WeatherState.notifyUser('Weather info marked as favourite'));
    } catch (e) {
      emit(const WeatherState.error("Unable to mark weather as favorite"));
    }
  }
}
