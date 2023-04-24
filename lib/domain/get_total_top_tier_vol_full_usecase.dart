import 'dart:async';

import 'package:cryptoku/common/base/base_usecase.dart';
import 'package:cryptoku/domain/model/crypto_data.dart';
import 'package:cryptoku/domain/repository/crypto_repository.dart';
import 'package:injectable/injectable.dart';

import '../injection.dart';

@lazySingleton
class GetTotalTopTierVolFullUsecase extends BaseUseCase<int, CryptoData> {
  @override
  FutureOr<CryptoData> invoke(int request) {
    return getIt<CryptoRepository>().getTotalTopTierVolFull(request);
  }
}
