import 'package:dvt_weather_app/data/local/database/database.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<WeatherAppDatabase> get database =>
      $FloorWeatherAppDatabase.databaseBuilder('flutter_database.db').build();
}
