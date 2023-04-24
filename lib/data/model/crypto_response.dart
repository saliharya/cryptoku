import 'package:json_annotation/json_annotation.dart';

import 'crypto_data.dart';
import 'meta_data_response.dart';

part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  @JsonKey(name: "Data")
  List<CryptoData>? data;

  @JsonKey(name: "MetaData")
  MetaDataResponse? metaData;

  CryptoResponse(this.data, this.metaData);

  factory CryptoResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoResponseToJson(this);
}
