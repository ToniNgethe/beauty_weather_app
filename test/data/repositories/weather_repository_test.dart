import 'package:dvt_weather_app/data/local/database/database.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:dvt_weather_app/data/network/api_provider.dart';
import 'package:dvt_weather_app/data/network/end_points.dart';
import 'package:dvt_weather_app/data/repositories/dto/current_weather_dto_response.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository_impl.dart';
import 'package:dvt_weather_app/utils/weather_types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_repository_test.mocks.dart';

@GenerateMocks([ApiProvider])
void main() {
  late MockApiProvider mockApiProvider;
  late WeatherAppDatabase weatherAppDatabase;
  late WeatherRepository weatherRepository;

  setUp(() async {
    mockApiProvider = MockApiProvider();
    weatherAppDatabase =
        await $FloorWeatherAppDatabase.inMemoryDatabaseBuilder().build();

    weatherRepository =
        WeatherRepositoryImpl(mockApiProvider, weatherAppDatabase);
  });

  tearDown(() {
    weatherAppDatabase.close();
  });

  final testWeatherModel =
      WeatherModel(1, 30.0, 34.1, 29, 1, 'forecast', 'test_location', 'today');
  final sampleResponseModel = {
    "coord": {"lon": 76.8888, "lat": 12.0268},
    "weather": [
      {
        "id": 804,
        "main": "Clouds",
        "description": "overcast clouds",
        "icon": "04d"
      }
    ],
    "base": "stations",
    "main": {
      "temp": 33.17,
      "feels_like": 30.8,
      "temp_min": 33.17,
      "temp_max": 33.17,
      "pressure": 1005,
      "humidity": 14,
      "sea_level": 1005,
      "grnd_level": 927
    },
    "visibility": 10000,
    "wind": {"speed": 1.26, "deg": 30, "gust": 3.32},
    "clouds": {"all": 98},
    "dt": 1647520092,
    "sys": {
      "type": 1,
      "id": 9212,
      "country": "IN",
      "sunrise": 1647478727,
      "sunset": 1647522186
    },
    "timezone": 19800,
    "id": 1274821,
    "name": "Chamrajnagar",
    "cod": 200
  };

  final sampleForeCastResponse = {
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
      {
        "dt": 1647529200,
        "main": {
          "temp": 30.17,
          "feels_like": 28.59,
          "temp_min": 27.11,
          "temp_max": 30.17,
          "pressure": 1008,
          "sea_level": 1008,
          "grnd_level": 929,
          "humidity": 25,
          "temp_kf": 3.06
        },
        "weather": [
          {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04n"
          }
        ],
        "clouds": {"all": 93},
        "wind": {"speed": 0.66, "deg": 174, "gust": 3.31},
        "visibility": 10000,
        "pop": 0.07,
        "sys": {"pod": "n"},
        "dt_txt": "2022-03-17 15:00:00"
      }
    ]
  };

  group('#getTodayWeather tests', () {
    test('#getTodayWeather returns #WeatherModel if its a success', () async {
      const url = EndPoints.baseUrl +
          'weather?lat=10.0&units=metric'
              '&lon=30.1'
              '&appid=${EndPoints.appKey}';

      when(mockApiProvider.get(url))
          .thenAnswer((_) async => sampleResponseModel);

      final response = await weatherRepository.getTodayWeather(10.0, 30.1);
      expect(response.locationName == "Chamrajnagar", true);
      verify(mockApiProvider.get(url)).called(1);
    });

    test('#getTodayWeather throws an error when api request', () async {
      const url = EndPoints.baseUrl +
          'weather?lat=10.0&units=metric'
              '&lon=30.1'
              '&appid=${EndPoints.appKey}';

      when(mockApiProvider.get(url)).thenThrow(Exception(''));

      expect(
          () => weatherRepository.getTodayWeather(10.0, 30.1), throwsException);
    });
  });

  test('verify correct weather type is returned from api response', () {
    WeatherRepositoryImpl weatherRepositoryImpl =
        WeatherRepositoryImpl(mockApiProvider, weatherAppDatabase);
    final weatherDtoObject =
        CurrentWeatherDtoResponse.fromJson(sampleResponseModel);
    final type = weatherRepositoryImpl.getWeatherType(weatherDtoObject);
    expect(type == WeatherTypes.cloudy.intValue, true);
  });

  group('#getFiveDaysWeather tests', () {
    test('#getFiveDaysWeather returns List<WeatherModel>', () async {
      const url = EndPoints.baseUrl +
          'forecast?lat=1.0&units=metric'
              '&lon=1.0'
              '&appid=${EndPoints.appKey}';
      when(mockApiProvider.get(url))
          .thenAnswer((_) async => sampleForeCastResponse);
      final list = await weatherRepository.getFiveDaysWeather(1, 1);
      final storedData =
          await weatherAppDatabase.weatherDao.getWeatherModels('forecast');

      expect(list.length == 1, true);
      expect(storedData?.length == 1, true);
      verify(mockApiProvider.get(url)).called(1);
    });

    test('#getFiveDaysWeather throws an error when api request', () async {
      const url = EndPoints.baseUrl +
          'forecast?lat=1.0&units=metric'
              '&lon=1.0'
              '&appid=${EndPoints.appKey}';

      when(mockApiProvider.get(url)).thenThrow(Exception(''));

      expect(() => weatherRepository.getFiveDaysWeather(1, 1), throwsException);
    });
  });

  group('#getCachedForeCastWeather tests', () {
    test('#getCachedForeCastWeather returns list of cached weather models',
        () async {
      await weatherAppDatabase.weatherDao.insertWeatherModel(testWeatherModel);
      final response = await weatherRepository.getCachedForeCastWeather();
      expect(response?.length == 1, isTrue);
    });

    test('#getCachedForeCastWeather returns empty list if no cached data found',
        () async {
      final response = await weatherRepository.getCachedForeCastWeather();
      expect(response?.isEmpty, isTrue);
    });
  });

  group('#getCachedTodayWeather tests', () {
    test('#getCachedTodayWeather returns current cached weather info',
            () async {
      testWeatherModel.tag = 'current';
          await weatherAppDatabase.weatherDao.insertWeatherModel(testWeatherModel);
          final response = await weatherRepository.getCachedTodayWeather();
          expect(response?.id == testWeatherModel.id, isTrue);
        });

    test('#getCachedTodayWeather returns null if cached data not found',
            () async {
          final response = await weatherRepository.getCachedTodayWeather();
          expect(response == null, isTrue);
        });
  });
}
