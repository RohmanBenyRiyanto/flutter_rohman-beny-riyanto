class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? password;
  String? token;
  final String? profilePhoto;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.password,
    this.token,
    this.profilePhoto,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      username: json["username"] ?? "",
      token: json["token"] ?? "",
      profilePhoto: json["profile_photo_url"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "username": username,
      "token": token,
      "profile_photo_url": profilePhoto,
    };
  }
}
