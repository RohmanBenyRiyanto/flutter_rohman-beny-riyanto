class GaleryModel {
  final int id;
  final int? productId;
  final String url;

  GaleryModel({
    required this.id,
    required this.productId,
    required this.url,
  });

  factory GaleryModel.fromJson(Map<String, dynamic> json) {
    return GaleryModel(
      id: json["id"] ?? 0,
      productId: json["products_id"] ?? 0,
      url: json["url"] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product_id": productId,
      "url": url,
    };
  }
}
