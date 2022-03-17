import 'package:dvt_weather_app/data/bloc/weather/weather_bloc.dart';
import 'package:dvt_weather_app/data/bloc/weather/weather_state.dart';
import 'package:dvt_weather_app/data/models/weather_model.dart';
import 'package:dvt_weather_app/di/injector.dart';
import 'package:dvt_weather_app/ui/home/widgets/weather_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteWeatherPage extends StatefulWidget {
  static const routeName = '/favourite_weather';

  const FavouriteWeatherPage({Key? key}) : super(key: key);

  @override
  State<FavouriteWeatherPage> createState() => _FavouriteWeatherPageState();
}

class _FavouriteWeatherPageState extends State<FavouriteWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Your favourite weather'),
      ),
      body: BlocProvider(
        create: (ctx) => getIt<WeatherBloc>()..fetchFavouriteWeatherInfo(),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (ctx, state) {
            return state.maybeWhen(
                orElse: () => const Align(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                loading: () => const Align(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ),
                error: (message) => WeatherErrorWidget(
                      message: message,
                      onRetry: () {
                        ctx.read<WeatherBloc>().fetchFavouriteWeatherInfo();
                      },
                    ),
                favWeather: (saved) {
                  return ListView.builder(
                    itemBuilder: (ctx, index) {
                      final weatherModel = saved![index];
                      return Container(
                        decoration: BoxDecoration(color: weatherModel.color),
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    '${weatherModel.locationName}',
                                    style: TextStyle(
                                      fontSize: 30.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${weatherModel.temp}',
                                          style: TextStyle(
                                              fontSize: 24.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '°',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        weatherModel.icon,
                                        height: 20,
                                        width: 20,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildMinMax('${weatherModel.min}', 'min'),
                                  buildMinMax(
                                      '${weatherModel.temp}', 'Current'),
                                  buildMinMax('${weatherModel.max}', 'max'),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: saved?.length,
                  );
                });
          },
        ),
      ),
    );
  }

  Column buildMinMax(String value, String text) {
    return Column(
      children: [
        textWithDegreeSymbol(value),
        Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        )
      ],
    );
  }

  Row textWithDegreeSymbol(String value) {
    return Row(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        Text(
          '°',
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        )
      ],
    );
  }
}
