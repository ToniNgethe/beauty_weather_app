import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherLoadingWidget extends StatelessWidget {
  const WeatherLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
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
}
