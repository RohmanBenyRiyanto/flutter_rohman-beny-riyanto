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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "description": description,
      "categories_id": categoriesId,
      "category": category!.toJson(),
      "galleries": galery!.map((gallery) => gallery.toJson()).toList(),
    };
  }
}

class UninitializedProductModel extends ProductModel {}
