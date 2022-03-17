import 'package:dvt_weather_app/data/local/dao/weather_dao.dart';
import 'package:dvt_weather_app/data/local/database/database.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late WeatherAppDatabase database;
  late WeatherDao weatherDao;

  setUp(() async {
    database = await $FloorWeatherAppDatabase.inMemoryDatabaseBuilder().build();
    weatherDao = database.weatherDao;
  });

  final testResponse =
      WeatherModel(1, 30.0, 34.1, 29, 1, 'test', 'test_location', 'today');
  final testResponse2 =
      WeatherModel(2, 30.0, 34.1, 29, 1, 'test', 'test_location', 'today');

  tearDown(() {
    database.close();
  });

  test('inserting saves weather model object', () async {
    await weatherDao.insertWeatherModel(testResponse);
    final response = await weatherDao.findWeatherById(testResponse.id!);
    expect(response?.id == testResponse.id, true);
  });

  test('update updates weather model object', () async {
    // insert
    await weatherDao.insertWeatherModel(testResponse);
    // fetch
    final response = await weatherDao.findWeatherById(testResponse.id!);
    // update
    response?.day = 'tomorrow';
    response?.min = 20;
    // update
    await weatherDao.updateWeatherModel(response!);

    final updateResponse = await weatherDao.findWeatherById(testResponse.id!);
    expect(
        updateResponse?.day == 'tomorrow' && updateResponse?.min == 20, true);
  });

  test('insert list of weather models', () async {
    await weatherDao.insertWeatherModels([testResponse, testResponse2]);
    final response = await weatherDao.getWeatherModels('test');
    expect(response?.length == 2, true);
  });

  test('delete by tag removes weather items inserted', () async {
    await weatherDao.insertWeatherModels([testResponse, testResponse2]);
    await weatherDao.deleteAllRecords('test', 'test');

    final response = await weatherDao.getWeatherModels('test');
    expect(response?.isEmpty, true);
  });

  test('get inserted weather model by tag ', () async {
    await weatherDao.insertWeatherModel(testResponse);
    final response = await weatherDao.getWeatherModelByTag('test');
    expect(response?.id == testResponse.id, true);
  });

  test('get weather info by location name', () async {
    await weatherDao.insertWeatherModel(testResponse);
    final response =
        await weatherDao.getWeatherByLocationName('test_location', 'test');
    expect(response?.id == testResponse.id, true);
  });
}
