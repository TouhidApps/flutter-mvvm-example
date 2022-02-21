import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {

  UserModel({
    this.message = "",
    this.users = const [],
  }) {

  }

  String message = "";
  List<User> users = <User>[];

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json["message"],
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "users": List<dynamic>.from(users.map((x) => x.toJson())),
  };
}

class User {
  User({
    this.id = "",
    this.name = "",
    this.phone = "",
    this.note = "",
  });

  String id;
  String name;
  String phone;
  String note;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "note": note,
  };

}
