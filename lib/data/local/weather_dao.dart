import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class WeatherDao {
  @insert
  Future<void> insertWeatherModel(WeatherModel weatherModel);

  @insert
  Future<void> insertWeatherModels(List<WeatherModel> weatherModel);

  @Query("DELETE FROM WeatherModel")
  Future<void> deleteAllRecords();

  @Query("SELECT * FROM WeatherModel WHERE tag = :tag")
  Future<WeatherModel?> getWeatherModelByTag(String tag);

  @Query("SELECT * FROM WeatherModel WHERE tag = :tag")
  Future<List<WeatherModel>?> getWeatherModels(String tag);
}
