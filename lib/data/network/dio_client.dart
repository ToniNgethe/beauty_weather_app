import 'package:dio/dio.dart';
import 'package:dvt_weather_app/data/network/end_points.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'logging_interceptor.dart';


@module
abstract class DioClient {
  @lazySingleton
  Dio get dio => _getDio();

  Dio _getDio() {
    final options = BaseOptions(
      baseUrl: Url.BASE_URL,
      connectTimeout: 50000,
      receiveTimeout: 30000,
    );
    final dio = Dio(options);

    if (kDebugMode) {
      dio.interceptors.add(LoggingInterceptor());
    }

    return dio;
  }
}
