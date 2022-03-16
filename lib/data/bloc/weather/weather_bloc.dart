import 'package:dvt_weather_app/data/bloc/weather/weather_state.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherBloc extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherState.init());

  void fetchTodayWeather(double? lat, double? long) async {
    try {
      emit(const WeatherState.loading());
      final response = await _weatherRepository.getTodayWeather(lat, long);
      emit(WeatherState.todayWeather(response));
    } catch (e) {
      emit(const WeatherState.error("Unable to fetch today's weather"));
    }
  }
}
