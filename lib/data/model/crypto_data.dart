import 'package:json_annotation/json_annotation.dart';

import 'coin_display.dart';
import 'coin_info.dart';

part 'crypto_data.g.dart';

@JsonSerializable()
class CryptoData {
  @JsonKey(name: "CoinInfo")
  CoinInfo? coinInfo;
  @JsonKey(name: "DISPLAY")
  CoinDisplay? coinDisplay;

  CryptoData(this.coinInfo, this.coinDisplay);

  factory CryptoData.fromJson(Map<String, dynamic> json) =>
      _$CryptoDataFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoDataToJson(this);
}
