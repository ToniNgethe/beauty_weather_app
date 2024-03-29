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

  @Query("DELETE FROM WeatherModel where tag = :tag1 OR tag = :tag2")
  Future<void> deleteAllRecords(String tag1, String tag2);

  @Query("SELECT * FROM WeatherModel WHERE tag = :tag")
  Future<WeatherModel?> getWeatherModelByTag(String tag);

  @Query(
      "SELECT * FROM WeatherModel WHERE locationName = :locationName AND tag = :tag")
  Future<WeatherModel?> getWeatherByLocationName(
      String locationName, String tag);

  @Query("SELECT * FROM WeatherModel WHERE tag = :tag")
  Future<List<WeatherModel>?> getWeatherModels(String tag);

  @Query('SELECT * FROM WeatherModel WHERE id = :id')
  Future<WeatherModel?> findWeatherById(int id);
}
