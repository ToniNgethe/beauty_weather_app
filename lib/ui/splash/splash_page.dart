import 'package:dvt_weather_app/data/bloc/location/location_bloc.dart';
import 'package:dvt_weather_app/data/bloc/location/location_state.dart';
import 'package:dvt_weather_app/di/injector.dart';
import 'package:dvt_weather_app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => getIt<LocationBloc>()..fetchUserCurrentLocation(),
      child: BlocConsumer<LocationBloc, LocationState>(
        listener: (ctx, state) {
          state.maybeWhen(
              orElse: () {},
              locationUpdate: (position) {
                Navigator.popAndPushNamed(context, HomePage.routeName,
                    arguments: position);
              });
        },
        builder: (ctx, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                  child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.thermostat_auto_outlined,
                      size: 40,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Welcome to our weather app',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    if (state.maybeWhen(
                        orElse: () => false, loading: () => true))
                      const CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    state.maybeWhen(
                        orElse: () => const SizedBox(),
                        error: (message) => _errorWidget(message, ctx))
                  ],
                ),
              )));
        },
      ),
    );
  }

  Widget _errorWidget(String message, BuildContext ctx) {
    return Column(
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey),
        ),
        TextButton(
            onPressed: () {
              ctx.read<LocationBloc>().fetchUserCurrentLocation();
            },
            child: const Text('Retry?'))
      ],
    );
  }
}
