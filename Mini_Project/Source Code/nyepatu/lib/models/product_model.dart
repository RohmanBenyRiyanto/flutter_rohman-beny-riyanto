import 'dart:convert';

import 'category_model.dart';
import 'gallery_model.dart';

class ProductModel {
  final int? id;
  final String? name;
  final double? price;
  final String? description;
  final int? categoriesId;
  final CategoryModel? category;
  final List<GaleryModel>? galery;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.categoriesId,
    this.category,
    this.galery,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      price: json["price"].toDouble() ?? 0.0,
      description: json["description"] ?? "",
      categoriesId: json["categories_id"] ?? 0,
      category: CategoryModel.fromJson(json["category"] ?? ""),
      galery: json["galleries"]
              .map<GaleryModel>((gallery) => GaleryModel.fromJson(gallery))
              .toList() ??
          [],
    );
  }

  static  Map<String, dynamic> toJson(ProductModel product) {
    return {
      "id": product.id,
      "name": product.name,
      "price": product.price,
      "description": product.description,
      "categories_id": product.categoriesId,
      "category": product.category!.toJson(),
      "galleries": product.galery!.map((gallery) => gallery.toJson()).toList(),
    };
  }

  static String encode(List<ProductModel> list) => json.encode(
        list.map<Map<String, dynamic>>((us) => ProductModel.toJson(us))
            .toList(),
      );

  static List<ProductModel> decode(String list) =>
      (json.decode(list) as List<dynamic>)
          .map<ProductModel>((item) => ProductModel.fromJson(item))
          .toList();
}

class UninitializedProductModel extends ProductModel {}
