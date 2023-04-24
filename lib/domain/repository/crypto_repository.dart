import 'package:cryptoku/domain/model/crypto_data.dart';

abstract class CryptoRepository {
  Future<CryptoData> getTotalTopTierVolFull(int page);
}
