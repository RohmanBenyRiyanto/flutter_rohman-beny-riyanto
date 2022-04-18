import 'dart:convert';

class ContactModel {
  int? id;
  String? name;
  String? phone;

  ContactModel({
    this.id,
    this.name,
    this.phone,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
    );
  }

  static Map<String, dynamic> toJson(ContactModel user) => {
        'id': user.id,
        'name': user.name,
        'phone': user.phone,
      };

  static String encode(List<ContactModel> userList) => json.encode(
        userList
            .map<Map<String, dynamic>>((us) => ContactModel.toJson(us))
            .toList(),
      );

  static List<ContactModel> decode(String userList) =>
      (json.decode(userList) as List<dynamic>)
          .map<ContactModel>((item) => ContactModel.fromJson(item))
          .toList();
}
