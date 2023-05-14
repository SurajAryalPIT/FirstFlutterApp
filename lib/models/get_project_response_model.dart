// To parse this JSON data, do
//
//     final getProjectResponseModel = getProjectResponseModelFromJson(jsonString);

import 'dart:convert';

GetProjectResponseModel getProjectResponseModelFromJson(String str) =>
    GetProjectResponseModel.fromJson(json.decode(str));

String getProjectResponseModelToJson(GetProjectResponseModel data) =>
    json.encode(data.toJson());

class GetProjectResponseModel {
  List<ProductList> productList;
  int status;
  String message;
  int nextPage;

  GetProjectResponseModel({
    required this.productList,
    required this.status,
    required this.message,
    required this.nextPage,
  });

  factory GetProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      GetProjectResponseModel(
        productList: List<ProductList>.from(
            json["productList"].map((x) => ProductList.fromJson(x))),
        status: json["status"],
        message: json["message"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "productList": List<dynamic>.from(productList.map((x) => x.toJson())),
        "status": status,
        "message": message,
        "nextPage": nextPage,
      };
}

class ProductList {
  String ukId;
  String alias;

  ProductList({
    required this.ukId,
    required this.alias,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        ukId: json["ukId"],
        alias: json["alias"],
      );

  Map<String, dynamic> toJson() => {
        "ukId": ukId,
        "alias": alias,
      };
}
