import 'dart:developer';

import 'package:archonit_crypto_app/data/api/coincap_api.dart';
import 'package:archonit_crypto_app/data/interceptors/api_key_interceptor.dart';
import 'package:dio/dio.dart';

CoinCapApiClient createCoinCapApiClient(String apiKey) {
  final dio = Dio();
  dio.interceptors.add(ApiKeyInterceptor(apiKey));
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (object) => log(object.toString()),
    ),
  );
  return CoinCapApiClient(dio);
}
