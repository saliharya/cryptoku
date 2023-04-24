import 'package:cryptoku/data/remote/crypto_api.dart';
import 'package:cryptoku/domain/model/crypto_data.dart';
import 'package:cryptoku/domain/repository/crypto_repository.dart';
import 'package:cryptoku/injection.dart';
import 'package:injectable/injectable.dart';

import '../../domain/mapper/crypto_data_mapper.dart';

@LazySingleton(as: CryptoRepository)
class CryptoRepositoryImpl extends CryptoRepository {
  @override
  Future<CryptoData> getTotalTopTierVolFull(int page) async {
    return map(await getIt<CryptoApi>().getTotalTopTierVolFull(page));
  }
}
