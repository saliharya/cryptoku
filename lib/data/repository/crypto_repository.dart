import 'package:cryptoku/data/remote/crypto_api.dart';

import '../model/crypto_response.dart';

class CryptoRepository {
  final _cryptoApi = CryptoApi();

  Future<CryptoResponse> getTotalTopTierVolFull() async {
    return _cryptoApi.getTotalTopTierVolFull();
  }
}
