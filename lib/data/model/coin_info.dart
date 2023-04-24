import 'package:json_annotation/json_annotation.dart';

part 'coin_info.g.dart';

@JsonSerializable()
class CoinInfo {
  @JsonKey(name: "Id")
  String? id;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "FullName")
  String? fullName;
  @JsonKey(name: "ImageUrl")
  String? imageUrl;
  String get fullImageUrl =>
      "https://www.cryptocompare.com/media${imageUrl ?? ""}";

  CoinInfo(this.id, this.name, this.fullName, this.imageUrl);

  factory CoinInfo.fromJson(Map<String, dynamic> json) =>
      _$CoinInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinInfoToJson(this);
}
