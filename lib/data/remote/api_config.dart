import 'package:dio/dio.dart';

class ApiConfig {
  static const apiKey =
      "849e8775236f9a5552211f58eb1afb83df200151be4c4b57388a38cd5d09557f";
  static const baseUrl = "https://min-api.cryptocompare.com/data";
  static const baseImUrl = "https://min-api.cryptocompare.com/data";
  static var dioBaseOption = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 20),
  );
}
