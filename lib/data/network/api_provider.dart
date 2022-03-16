import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'end_points.dart';

@singleton
class ApiProvider {
  final Dio _dio;

  ApiProvider(this._dio);

  Future<dynamic> post(Map payload, String url) async {
    try {
      final response = await _dio.post<void>(url, data: jsonEncode(payload));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await _dio.get<dynamic>(url);
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
