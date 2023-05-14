// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) =>
    LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) =>
    json.encode(data.toJson());

class LoginRequestModel {
  String initial;
  String userName;
  String password;
  String machineName;

  LoginRequestModel({
    required this.initial,
    required this.userName,
    required this.password,
    required this.machineName,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        initial: json["initial"],
        userName: json["userName"],
        password: json["password"],
        machineName: json["machineName"],
      );

  Map<String, dynamic> toJson() => {
        "initial": initial,
        "userName": userName,
        "password": password,
        "machineName": machineName,
      };
}
