import 'package:dvt_weather_app/utils/app_colors.dart';
import 'package:dvt_weather_app/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sunny,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                Assets.sunny,
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
                        '50',
                        style: TextStyle(
                            fontSize: 80.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          '0',
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Text(
                    'SUNNY',
                    style: TextStyle(fontSize: 26.sp, color: Colors.white),
                  ),
                  SizedBox(
                    height: 50.h,
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildMinMax('19', 'min'),
                buildMinMax('19', 'Current'),
                buildMinMax('19', 'max'),
              ],
            ),
          ),
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
      ),
    );
  }

  Column buildMinMax(String value, String text) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        )
      ],
    );
  }
}
