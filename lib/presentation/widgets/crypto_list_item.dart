import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptoku/domain/model/crypto_item.dart';
import 'package:flutter/material.dart';

class CryptoListItem extends StatelessWidget {
  final CryptoItem data;

  const CryptoListItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: data.imageUrl,
                width: 40,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.symbol),
                    Text(data.fullName),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                data.price,
                style: const TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
