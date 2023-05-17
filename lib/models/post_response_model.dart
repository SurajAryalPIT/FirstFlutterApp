// To parse this JSON data, do
//
//     final postResponseModel = postResponseModelFromJson(jsonString);

import 'dart:convert';

PostResponseModel postResponseModelFromJson(String str) =>
    PostResponseModel.fromJson(json.decode(str));

String postResponseModelToJson(PostResponseModel data) =>
    json.encode(data.toJson());

class PostResponseModel {
  Data data;
  int status;
  String message;
  int nextPage;

  PostResponseModel({
    required this.data,
    required this.status,
    required this.message,
    required this.nextPage,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      PostResponseModel(
        data: Data.fromJson(json["data"]),
        status: json["status"],
        message: json["message"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "status": status,
        "message": message,
        "nextPage": nextPage,
      };
}

class Data {
  String tokenNo;

  Data({
    required this.tokenNo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tokenNo: json["tokenNo"],
      );

  Map<String, dynamic> toJson() => {
        "tokenNo": tokenNo,
      };
}
