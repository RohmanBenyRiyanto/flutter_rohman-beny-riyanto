import 'dart:convert';

class User {
  final String? name;
  final String? avatar;
  final String? phone;
  final String? status;
  final String? gender;
  final String? hobi;

  User({
    this.name,
    this.avatar,
    this.phone,
    this.status,
    this.gender,
    this.hobi,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      avatar: json['avatar'],
      phone: json['phone'],
      status: json['status'],
      gender: json['gender'],
      hobi: json['hobi'],
    );
  }

  static Map<String, dynamic> toMap(User user) => {
        "name": user.name,
        "avatar": user.avatar,
        "phone": user.phone,
        "status": user.status,
        "gender": user.gender,
        "hobi": user.hobi,
      };

  static String encode(List<User> UserList) => json.encode(
        UserList.map<Map<String, dynamic>>((us) => User.toMap(us)).toList(),
      );

  static List<User> decode(String UserList) =>
      (json.decode(UserList) as List<dynamic>)
          .map<User>((item) => User.fromJson(item))
          .toList();

  @override
  String toString() =>
      '{name : $name, avatar : $avatar, phone: $phone, status : $status, gender : $gender, hobi : $hobi}';
}

List<User> userList = [
  User(
    name: "Kim Ji-soo",
    avatar:
        "https://i.pinimg.com/236x/a2/31/01/a2310147775da5802d3e2b5ba458bdd8.jpg",
    phone: "+821055570582",
    status: "Belum Menikah",
    gender: "Perempuan",
    hobi: 'Sing',
  ),
  User(
    name: "Lalisa Manoban",
    avatar:
        "https://i.pinimg.com/564x/67/1e/d0/671ed042fe28a90fbd61f7ce95d0ec6e.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Kim Jennie",
    avatar:
        "https://i.pinimg.com/564x/bf/34/e2/bf34e2cc7a7edb721120a54b3d29ccd0.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Rosé",
    avatar:
        "https://i.pinimg.com/564x/d6/81/b5/d681b52afbcdceb338d3f50f0b1debd2.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Shin Ryu-jin",
    avatar:
        "https://i.pinimg.com/564x/7e/b1/60/7eb16069cd22cdb218301764d2fdda73.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Tzuyu",
    avatar:
        "https://i.pinimg.com/564x/28/b0/da/28b0da3f959f295501e130685a08355f.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Joy",
    avatar:
        "https://i.pinimg.com/564x/01/2d/36/012d36cbab5da065ae98ba80f7ee2ba5.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Han So Hee",
    avatar:
        "https://i.pinimg.com/564x/5a/fc/c2/5afcc221287f364ce09b7852fe542e97.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Kim Da-mi",
    avatar:
        "https://i.pinimg.com/564x/5d/43/3b/5d433b62c2ae48071e37d0bee6936a60.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Im Yoon-ah",
    avatar:
        "https://i.pinimg.com/564x/f8/b7/b6/f8b7b68ed4c2db7ae7437c5383d0b2f3.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Lee Ji-eun",
    avatar:
        "https://i.pinimg.com/564x/34/98/11/34981181cda932bc5fabec9c2b8bac62.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
  User(
    name: "Bae Suzy",
    avatar:
        "https://i.pinimg.com/564x/0e/a3/81/0ea381cdad7bdb6d332956885e01dc41.jpg",
    phone: "+821155592562",
    status: "Belum Menikah",
    gender: "Perempuan",
  ),
];
