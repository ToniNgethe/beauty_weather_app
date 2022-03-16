import 'package:dvt_weather_app/data/bloc/weather/weather_bloc.dart';
import 'package:dvt_weather_app/data/bloc/weather/weather_state.dart';
import 'package:dvt_weather_app/data/models/current_weather_model.dart';
import 'package:dvt_weather_app/utils/app_colors.dart';
import 'package:dvt_weather_app/utils/assets.dart';
import 'package:dvt_weather_app/utils/weather_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _position;

  @override
  void didChangeDependencies() {
    _position = ModalRoute.of(context)?.settings.arguments as Position;
    context
        .read<WeatherBloc>()
        .fetchTodayWeather(_position?.latitude, _position?.longitude);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        return Scaffold(
          backgroundColor: state.maybeWhen(
              orElse: () => Colors.white,
              todayWeather: (weather) => weather.color),
          body: state.maybeWhen(
              orElse: () => _buildLoadingWidget(),
              loading: _buildLoadingWidget,
              error: (message) {},
              todayWeather: (weather) => _buildWeatherWidget(weather)),
        );
      },
    );
  }

  Widget _buildWeatherWidget(CurrentWeatherModel currentWeatherModel) {
    return Column(
      children: [
        _todayWeather(currentWeatherModel),
        const Divider(
          color: Colors.white,
          thickness: 1,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Monday',
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                    Image.asset(Assets.clear),
                    Text(
                      '40',
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    )
                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        )
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Fetching your current location weather information',
              style: TextStyle(color: Colors.grey, fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          const CircularProgressIndicator(
            strokeWidth: 1,
          )
        ],
      ),
    );
  }

  Widget _todayWeather(CurrentWeatherModel currentWeatherModel) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              currentWeatherModel.asset!,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${currentWeatherModel.temp}',
                      style: TextStyle(
                          fontSize: 60.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '°',
                      style: TextStyle(fontSize: 50.sp, color: Colors.white),
                    )
                  ],
                ),
                Text(
                  '${currentWeatherModel.weatherType?.desc}',
                  style: TextStyle(fontSize: 26.sp, color: Colors.white),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildMinMax('${currentWeatherModel.min}', 'min'),
              buildMinMax('${currentWeatherModel.temp}', 'Current'),
              buildMinMax('${currentWeatherModel.max}', 'max'),
            ],
          ),
        ),
      ],
    );
  }

  Column buildMinMax(String value, String text) {
    return Column(
      children: [
        Row(
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
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        )
      ],
    );
  }
}
