import 'package:dvt_weather_app/ui/home/home_page.dart';
import 'package:dvt_weather_app/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => const SplashPage(),
  HomePage.routeName: (context) => const HomePage(),
};
