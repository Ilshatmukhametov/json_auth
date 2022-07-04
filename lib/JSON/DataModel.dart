// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.status,
    required this.id,
    required this.message,
  });

  bool status;
  String id;
  String message;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    status: json["status"],
    id: json["id"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "id": id,
    "message": message,
  };
}