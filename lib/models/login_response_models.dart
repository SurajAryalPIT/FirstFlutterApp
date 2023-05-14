// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  Data data;
  int status;
  String message;
  int nextPage;

  LoginResponseModel({
    required this.data,
    required this.status,
    required this.message,
    required this.nextPage,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
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
  String outletId;
  String departmentName;
  String counterId;
  String shiftCode;
  String userGroupId;
  String userName;
  String userId;
  String businessNature;
  String guid;
  String isAdmin;
  String editStock;
  String financeActivity;
  String useGps;
  String isTaxInclusive;

  Data({
    required this.tokenNo,
    required this.outletId,
    required this.departmentName,
    required this.counterId,
    required this.shiftCode,
    required this.userGroupId,
    required this.userName,
    required this.userId,
    required this.businessNature,
    required this.guid,
    required this.isAdmin,
    required this.editStock,
    required this.financeActivity,
    required this.useGps,
    required this.isTaxInclusive,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tokenNo: json["tokenNo"],
        outletId: json["outletId"],
        departmentName: json["departmentName"],
        counterId: json["counterId"],
        shiftCode: json["shiftCode"],
        userGroupId: json["userGroupId"],
        userName: json["userName"],
        userId: json["userId"],
        businessNature: json["businessNature"],
        guid: json["guid"],
        isAdmin: json["isAdmin"],
        editStock: json["editStock"],
        financeActivity: json["financeActivity"],
        useGps: json["useGps"],
        isTaxInclusive: json["isTaxInclusive"],
      );

  Map<String, dynamic> toJson() => {
        "tokenNo": tokenNo,
        "outletId": outletId,
        "departmentName": departmentName,
        "counterId": counterId,
        "shiftCode": shiftCode,
        "userGroupId": userGroupId,
        "userName": userName,
        "userId": userId,
        "businessNature": businessNature,
        "guid": guid,
        "isAdmin": isAdmin,
        "editStock": editStock,
        "financeActivity": financeActivity,
        "useGps": useGps,
        "isTaxInclusive": isTaxInclusive,
      };
}
