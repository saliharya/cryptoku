import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data_response.g.dart';

@JsonSerializable()
class MetaDataResponse {
  @JsonKey(name: "Count")
  int? count;

  MetaDataResponse(this.count);

  factory MetaDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MetaDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataResponseToJson(this);
}
