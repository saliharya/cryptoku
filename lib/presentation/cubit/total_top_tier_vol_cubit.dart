import 'package:cryptoku/domain/get_total_top_tier_vol_full_usecase.dart';
import 'package:cryptoku/domain/model/crypto_item.dart';
import 'package:cryptoku/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'total_top_tier_vol_cubit.freezed.dart';
part 'total_top_tier_vol_state.dart';

@injectable
class TotalTopTierVolCubit extends Cubit<TotalTopTierVolState> {
  TotalTopTierVolCubit() : super(const TotalTopTierVolState.loading());

  var currentPage = 0;
  var totalPage = 0;
  var list = <CryptoItem>[];

  void getTotalTopTierVolFull() async {
    if (!allowFetchNext()) return;
    if (list.isEmpty) emit(const TotalTopTierVolState.loading());
    try {
      final response =
          await getIt<GetTotalTopTierVolFullUsecase>().invoke(currentPage);
      totalPage = response.totalCount;
      final list = response.item;
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
