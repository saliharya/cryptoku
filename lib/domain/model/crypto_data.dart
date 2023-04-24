import 'crypto_item.dart';

class CryptoData {
  int totalCount;
  List<CryptoItem> item;

  CryptoData(this.totalCount, this.item);

  factory CryptoData.empty() => CryptoData(0, []);
}
