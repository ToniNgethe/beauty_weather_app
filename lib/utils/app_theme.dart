import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static void setAndroidStatusColors() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.white, // status bar color
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark));
  }

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.white,
            titleTextStyle: TextStyle(color: Colors.grey, fontSize: 16.sp),
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.grey)),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.rubikTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }
}
