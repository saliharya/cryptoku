part of 'total_top_tier_vol_cubit.dart';

@freezed
class TotalTopTierVolState with _$TotalTopTierVolState {
  const factory TotalTopTierVolState.loading() = _Loading;
  const factory TotalTopTierVolState.success(List<CryptoItem> list) = _Success;
  const factory TotalTopTierVolState.noData() = _NoData;
  const factory TotalTopTierVolState.error(DioError error) = _Error;
}
