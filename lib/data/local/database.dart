import 'dart:async';

import 'package:dvt_weather_app/data/local/weather_dao.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [WeatherModel])
abstract class WeatherAppDatabase extends FloorDatabase {
  WeatherDao get weatherDao;
}
