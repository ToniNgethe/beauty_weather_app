import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherErrorWidget extends StatelessWidget {
  final String message;
  final Function onRetry;

  const WeatherErrorWidget(
      {Key? key, required this.message, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              message,
              style: TextStyle(color: Colors.grey, fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
              onPressed: () {
                onRetry.call();
              },
              child: const Text('Retry?'))
        ],
      ),
    );
  }
}
