import 'dart:convert';

import 'package:cryptoku/data/remote/api_config.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/crypto_response.dart';

@lazySingleton
class CryptoApi {
  Future<CryptoResponse> getTotalTopTierVolFull(int page) async {
    final dio = Dio(ApiConfig.dioBaseOption);
    final response = await dio.get(
      "/top/totaltoptiervolfull",
      queryParameters: {
        "limit": 10,
        "page": page,
        "tsym": "USD",
        "apiKey": ApiConfig.apiKey,
      },
    );
    return CryptoResponse.fromJson(json.decode(json.encode(response.data)));
  }
}
