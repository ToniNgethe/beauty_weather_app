import 'package:dvt_weather_app/data/bloc/weather/weather_bloc.dart';
import 'package:dvt_weather_app/data/bloc/weather/weather_state.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:dvt_weather_app/di/injector.dart';
import 'package:dvt_weather_app/ui/home/widgets/weather_error_widget.dart';
import 'package:dvt_weather_app/ui/home/widgets/weather_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class WeatherForecastWidget extends StatelessWidget {
  final Position position;
  final String? lastUpdated;

  const WeatherForecastWidget(
      {Key? key, required this.position, this.lastUpdated})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<WeatherBloc>()
        ..fetchForecastWeather(position.latitude, position.longitude),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (ctx, state) {
          return state.maybeWhen(
              orElse: () => const WeatherLoadingWidget(),
              loading: () => const WeatherLoadingWidget(),
              error: (message) => WeatherErrorWidget(
                    message: message,
                    onRetry: () {
                      ctx.read<WeatherBloc>().fetchForecastWeather(
                          position.latitude, position.longitude);
                    },
                  ),
              forecastWeather: (weather) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${weather![index].day}',
                                      style: TextStyle(
                                          fontSize: 20.sp, color: Colors.white),
                                    ),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                      weather[index].icon,
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  Expanded(
                                      child: Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        '${weather[index].temp}',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        '°',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Colors.white),
                                      )
                                    ],
                                  ))
                                ],
                              ),
                            );
                          },
                          itemCount: weather?.length,
                        ),
                      ),
                      if (lastUpdated != null)
                        SafeArea(
                            top: false,
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'Last updated : $lastUpdated',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ))
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}
