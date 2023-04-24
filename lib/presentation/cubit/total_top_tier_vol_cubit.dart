import 'package:bloc/bloc.dart';
import 'package:cryptoku/injection.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/crypto_data.dart';
import '../../data/repository/crypto_repository.dart';

part 'total_top_tier_vol_cubit.freezed.dart';
part 'total_top_tier_vol_state.dart';

@injectable
class TotalTopTierVolCubit extends Cubit<TotalTopTierVolState> {
  TotalTopTierVolCubit() : super(const TotalTopTierVolState.loading());

  var currentPage = 0;
  var totalPage = 0;
  var list = <CryptoData>[];

  void getTotalTopTierVolFull() async {
    if (!allowFetchNext()) return;
    if (list.isEmpty) emit(const TotalTopTierVolState.loading());
    try {
      final response =
          await getIt<CryptoRepository>().getTotalTopTierVolFull(currentPage);
      totalPage = response.metaData?.count ?? 0;
      final list = response.data ?? [];
      if (list.isEmpty) {
        emit(const TotalTopTierVolState.noData());
      } else {
        this.list.addAll(list);
        emit(TotalTopTierVolState.success(list));
        currentPage++;
      }
    } on DioError catch (e) {
      emit(TotalTopTierVolState.error(e));
    }
  }

  bool allowFetchNext() => list.isEmpty || totalPage > list.length;
}
