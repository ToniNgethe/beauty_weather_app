import 'package:flutter/foundation.dart';

enum EndPoints { login, accounts, banks }

extension Url on EndPoints {
  static const String BASE_URL = kDebugMode
      ? "https://kluster-sacco-api-sandbox.binary.co.ke/api/"
      : "http://41.139.218.230:9010/api/";
  static const String OAUTH2_ENDPOINT = kDebugMode
      ? "https://kluster-sacco-api-sandbox.binary.co.ke/oauth/token"
      : "http://41.139.218.230:9010/oauth/token";

  String get url {
    switch (this) {
      case EndPoints.login:
        return OAUTH2_ENDPOINT;
      case EndPoints.accounts:
        return "${BASE_URL}v1/accounts";
      case EndPoints.banks:
        return '${BASE_URL}v1/fetch-banks';
      default:
        throw Exception('Url not set');
    }
  }
}
