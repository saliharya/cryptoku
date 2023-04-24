import 'package:json_annotation/json_annotation.dart';

import 'crypto_data.dart';

part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  @JsonKey(name: "Data")
  List<CryptoData>? data;

  CryptoResponse(this.data);

  factory CryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoResponseToJson(this);
}
