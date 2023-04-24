class CryptoItem {
  String id;
  String name;
  String fullName;
  String imageUrl;
  String symbol;
  String price;

  CryptoItem(
    this.id,
    this.name,
    this.fullName,
    this.imageUrl,
    this.symbol,
    this.price,
  );

  factory CryptoItem.empty() => CryptoItem("", "", "", "", "", "");
}
