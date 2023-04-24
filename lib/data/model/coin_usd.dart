import 'package:freezed_annotation/freezed_annotation.dart';

import 'coin_display.dart';

part 'coin_usd.g.dart';

@JsonSerializable()
class CoinUsd {
  @JsonKey(name: "FROMSYMBOL")
  String? symbol;
  @JsonKey(name: "PRICE")
  String? price;

  CoinUsd(this.symbol, this.price);

  factory CoinUsd.fromJson(Map<String, dynamic> json) =>
      _$CoinUsdFromJson(json);

  Map<String, dynamic> toJson() => _$CoinUsdToJson(this);
}
