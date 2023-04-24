import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/crypto_data.dart';
import '../../data/repository/crypto_repository.dart';

part 'total_top_tier_vol_cubit.freezed.dart';
part 'total_top_tier_vol_state.dart';

class TotalTopTierVolCubit extends Cubit<TotalTopTierVolState> {
  TotalTopTierVolCubit() : super(const TotalTopTierVolState.loading()) {
    getTotalTopTierVolFull();
  }

  final cryptoRepository = CryptoRepository();

  void getTotalTopTierVolFull() async {
    emit(const TotalTopTierVolState.loading());
    try {
      final response = await cryptoRepository.getTotalTopTierVolFull();
      final list = response.data ?? [];
      if (list.isEmpty) {
        emit(const TotalTopTierVolState.noData());
      } else {
        emit(TotalTopTierVolState.success(list));
      }
    } on DioError catch (e) {
      emit(TotalTopTierVolState.error(e));
    }
  }
}
