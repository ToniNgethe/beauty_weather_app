import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class WeatherDao {
  @insert
  Future<void> insertWeatherModel(WeatherModel weatherModel);

  @update
  Future<void> updateWeatherModel(WeatherModel weatherModel);

  @insert
  Future<void> insertWeatherModels(List<WeatherModel> weatherModel);

  @update
  Future<void> updateWeatherModels(List<WeatherModel> weatherModel);

  @delete
  Future<void> deleteAll(List<WeatherModel> weatherModel);
}
