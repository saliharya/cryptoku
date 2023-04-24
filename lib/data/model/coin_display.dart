import 'package:json_annotation/json_annotation.dart';

import 'coin_usd.dart';

part 'coin_display.g.dart';

@JsonSerializable()
class CoinDisplay {
  @JsonKey(name: "USD")
  CoinUsd? coinUsd;

  CoinDisplay(this.coinUsd);

  factory CoinDisplay.fromJson(Map<String, dynamic> json) =>
      _$CoinDisplayFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDisplayToJson(this);
}
