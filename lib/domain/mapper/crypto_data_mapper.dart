import 'package:cryptoku/data/model/crypto_response.dart';
import 'package:cryptoku/domain/model/crypto_data.dart';
import 'package:cryptoku/domain/model/crypto_item.dart';

CryptoData map(CryptoResponse response) {
  return CryptoData(
    response.metaData?.count ?? 0,
    (response.data ?? [])
        .map((e) => CryptoItem(
              e.coinInfo?.id ?? "",
              e.coinInfo?.name ?? "",
              e.coinInfo?.fullName ?? "",
              e.coinInfo?.fullImageUrl ?? "",
              e.coinDisplay?.coinUsd?.symbol ?? "",
              e.coinDisplay?.coinUsd?.price ?? "",
            ))
        .toList(),
  );
}
