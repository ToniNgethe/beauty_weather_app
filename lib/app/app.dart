import 'package:dvt_weather_app/app/routes.dart';
import 'package:dvt_weather_app/ui/splash/splash_page.dart';
import 'package:dvt_weather_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
        builder: (context, widget) {
          //add this line
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Solution Sacco',
        theme: AppTheme.themeData(context),
        initialRoute: SplashPage.routeName,
        routes: routes,
      ),
    );
  }
}
