import 'package:cryptoku/data/remote/crypto_api.dart';
import 'package:cryptoku/injection.dart';
import 'package:injectable/injectable.dart';

import '../model/crypto_response.dart';

@lazySingleton
class CryptoRepository {
  Future<CryptoResponse> getTotalTopTierVolFull(int page) async {
    return getIt<CryptoApi>().getTotalTopTierVolFull(page);
  }
}
