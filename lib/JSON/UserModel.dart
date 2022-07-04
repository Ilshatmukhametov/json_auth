// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.message,
    required this.status,
  });

  String userId;
  String message;
  String status;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json["USER_ID"],
    message: json["MESSAGE"],
    status: json["STATUS"],

  );

  Map<String, dynamic> toJson() => {
    "USER_ID": userId,
    "MESSAGE": message,
    "STATUS": status,
  };
}