import 'dart:convert';

class FoodModel {
  int? id;
  String? name;

  FoodModel({
    this.id,
    this.name,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'],
      name: json['name'],
    );
  }

  static Map<String, dynamic> toJson(FoodModel user) => {
        'id': user.id,
        'name': user.name,
      };

  static String encode(List<FoodModel> userList) => json.encode(
        userList
            .map<Map<String, dynamic>>((us) => FoodModel.toJson(us))
            .toList(),
      );

  static List<FoodModel> decode(String userList) =>
      (json.decode(userList) as List<dynamic>)
          .map<FoodModel>((item) => FoodModel.fromJson(item))
          .toList();
}
