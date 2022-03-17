import 'package:bloc_test/bloc_test.dart';
import 'package:dvt_weather_app/data/bloc/weather/weather_bloc.dart';
import 'package:dvt_weather_app/data/bloc/weather/weather_state.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:dvt_weather_app/data/repositories/weather_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_bloc_test.mocks.dart';

@GenerateMocks([WeatherRepository])
void main() {
  late MockWeatherRepository mockWeatherRepository;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    weatherBloc = WeatherBloc(mockWeatherRepository);
  });

  tearDown(() {
    weatherBloc.close();
  });

  final testResponse =
      WeatherModel(1, 30.0, 34.1, 29, 1, 'test', 'test', 'today');

  group('#fetchWeatherInfo tests', () {
    blocTest(
        'emit [ WeatherState.loading()] and [WeatherState.todayWeather()] when its a first time request',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getCachedTodayWeather())
              .thenAnswer((_) async => null);
          when(mockWeatherRepository.getTodayWeather(any, any))
              .thenAnswer((_) async => WeatherModel(
                  1,
                  30.0,
                  34.1,
                  29,
                  1,
                  'test',
                  'test',
                  'today'
                      ''));

          return weatherBloc.fetchWeatherInfo(10.0, 0.036);
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherTodayState>()],
        verify: (_) {
          verify(mockWeatherRepository.getCachedTodayWeather()).called(1);
          verify(mockWeatherRepository.getTodayWeather(any, any)).called(1);
        });

    blocTest(
        'emit [ WeatherState.loading()] and [WeatherState.todayWeather()] '
        'when its a second time request and cached data is available',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          final testResponse =
              WeatherModel(1, 30.0, 34.1, 29, 1, 'test', 'test', 'today');
          when(mockWeatherRepository.getCachedTodayWeather())
              .thenAnswer((_) async => testResponse);
          when(mockWeatherRepository.getTodayWeather(any, any))
              .thenAnswer((_) async => testResponse);

          return weatherBloc.fetchWeatherInfo(10.0, 0.036);
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherTodayState>()],
        verify: (_) {
          verify(mockWeatherRepository.getCachedTodayWeather()).called(1);
          verify(mockWeatherRepository.getTodayWeather(any, any)).called(1);
        });

    blocTest(
        'emit [ WeatherState.loading()] and [WeatherState.todayWeather()] '
        'when getTodayWeather request fails',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          final testResponse =
              WeatherModel(1, 30.0, 34.1, 29, 1, 'test', 'test', 'today');
          when(mockWeatherRepository.getCachedTodayWeather())
              .thenAnswer((_) async => testResponse);
          when(mockWeatherRepository.getTodayWeather(any, any))
              .thenThrow(Exception());

          return weatherBloc.fetchWeatherInfo(10.0, 0.036);
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherTodayState>()],
        verify: (_) {
          verify(mockWeatherRepository.getCachedTodayWeather()).called(2);
          verify(mockWeatherRepository.getTodayWeather(any, any)).called(1);
        });

    blocTest(
        'emit [ WeatherState.loading()] and [WeatherState.error()] '
        'when getTodayWeather request fails and there is no cached data',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getCachedTodayWeather())
              .thenAnswer((_) async => null);
          when(mockWeatherRepository.getTodayWeather(any, any))
              .thenThrow(Exception());

          return weatherBloc.fetchWeatherInfo(10.0, 0.036);
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherErrorState>()],
        verify: (_) {
          verify(mockWeatherRepository.getCachedTodayWeather()).called(2);
          verify(mockWeatherRepository.getTodayWeather(any, any)).called(1);
        });
  });

  group('#fetchForecastWeather method tests', () {
    blocTest(
        'emit [WeatherState.loading()] and [WeatherState.forecastWeather()] '
        'when first time request is a success',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getCachedForeCastWeather())
              .thenAnswer((_) async => []);
          when(mockWeatherRepository.getFiveDaysWeather(any, any))
              .thenAnswer((_) async => [testResponse, testResponse]);

          return weatherBloc.fetchForecastWeather(0.11, 30.12);
        },
        expect: () => [
              const WeatherState.loading(),
              WeatherState.forecastWeather([testResponse, testResponse])
            ],
        verify: (_) {
          verify(mockWeatherRepository.getCachedForeCastWeather()).called(1);
          verify(mockWeatherRepository.getFiveDaysWeather(any, any)).called(1);
        });

    blocTest(
        'emit [WeatherState.loading()] and [WeatherState.forecastWeather()] '
        'when second time request is a success',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getCachedForeCastWeather())
              .thenAnswer((_) async => [testResponse, testResponse]);
          when(mockWeatherRepository.getFiveDaysWeather(any, any))
              .thenAnswer((_) async => [testResponse, testResponse]);

          return weatherBloc.fetchForecastWeather(0.11, 30.12);
        },
        expect: () => [
              const WeatherState.loading(),
              WeatherState.forecastWeather([testResponse, testResponse])
            ],
        verify: (_) {
          verify(mockWeatherRepository.getCachedForeCastWeather()).called(1);
          verify(mockWeatherRepository.getFiveDaysWeather(any, any)).called(1);
        });

    blocTest(
        'emit [WeatherState.loading()] and [WeatherState.forecastWeather()] '
        'when #getFiveDaysWeather fails but there is cached data ',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getCachedForeCastWeather())
              .thenAnswer((_) async => []);
          when(mockWeatherRepository.getFiveDaysWeather(any, any))
              .thenThrow(Exception());

          return weatherBloc.fetchForecastWeather(0.11, 30.12);
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherErrorState>()],
        verify: (_) {
          verify(mockWeatherRepository.getCachedForeCastWeather()).called(2);
          verify(mockWeatherRepository.getFiveDaysWeather(any, any)).called(1);
        });

    blocTest(
        'emit [WeatherState.loading()] and [WeatherState.errorState()] '
        'when #getFiveDaysWeather fails and there is no cached data ',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getCachedForeCastWeather())
              .thenAnswer((_) async => []);
          when(mockWeatherRepository.getFiveDaysWeather(any, any))
              .thenThrow(Exception());

          return weatherBloc.fetchForecastWeather(0.11, 30.12);
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherErrorState>()],
        verify: (_) {
          verify(mockWeatherRepository.getCachedForeCastWeather()).called(2);
          verify(mockWeatherRepository.getFiveDaysWeather(any, any)).called(1);
        });
  });

  group('#markWeatherAsFavourite tests', () {
    blocTest(
        'emit [WeatherState.loading] and [WeatherState.notifyUser] when request is a successs',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.markWeatherAsFavourite())
              .thenAnswer((_) => Future.value());
          return weatherBloc.markWeatherAsFavourite();
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherNotifyState>()],
        verify: (_) {
          verify(mockWeatherRepository.markWeatherAsFavourite()).called(1);
        });

    blocTest(
        'emit [WeatherState.loading] and [WeatherState.notifyUser] when request fails',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.markWeatherAsFavourite())
              .thenThrow(Exception());
          return weatherBloc.markWeatherAsFavourite();
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherNotifyState>()],
        verify: (_) {
          verify(mockWeatherRepository.markWeatherAsFavourite()).called(1);
        });
  });

  group('#fetchFavouriteWeatherInfo tests', () {
    blocTest(
        'emit [WeatherState.loading] and [WeatherState.favWeather] when request is a successs',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getAllFavWeather())
              .thenAnswer((_) async => [testResponse]);
          return weatherBloc.fetchFavouriteWeatherInfo();
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherFavState>()],
        verify: (_) {
          verify(mockWeatherRepository.getAllFavWeather()).called(1);
        });

    blocTest(
        'emit [WeatherState.loading] and [WeatherState.error] '
        'throws an error when not favs found ',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getAllFavWeather())
              .thenAnswer((_) async => []);
          return weatherBloc.fetchFavouriteWeatherInfo();
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherErrorState>()],
        verify: (_) {
          verify(mockWeatherRepository.getAllFavWeather()).called(1);
        });

    blocTest(
        'emit [WeatherState.loading] and [WeatherState.error] '
        'throws an error when request fails ',
        build: () => weatherBloc,
        act: (WeatherBloc weatherBloc) {
          when(mockWeatherRepository.getAllFavWeather()).thenThrow(Exception());
          return weatherBloc.fetchFavouriteWeatherInfo();
        },
        expect: () => [isA<WeatherLoadingState>(), isA<WeatherErrorState>()],
        verify: (_) {
          verify(mockWeatherRepository.getAllFavWeather()).called(1);
        });
  });
}
