import 'package:dvt_weather_app/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.popAndPushNamed(context, HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              )
            ],
          ),
        )));
  }
}
