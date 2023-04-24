import 'dart:convert';

import 'package:cryptoku/data/remote/api_config.dart';
import 'package:dio/dio.dart';

import '../model/crypto_response.dart';

class CryptoApi {
  Future<CryptoResponse> getTotalTopTierVolFull() async {
    final dio = Dio(ApiConfig.dioBaseOption);
    final response = await dio.get(
      "/top/totaltoptiervolfull",
      queryParameters: {
        "limit": 50,
        "tsym": "USD",
        "apiKey": ApiConfig.apiKey,
      },
    );
    return CryptoResponse.fromJson(json.decode(json.encode(response.data)));
  }
}
