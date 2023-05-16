// To parse this JSON data, do
//
//     final getModuleListByProductRequest = getModuleListByProductRequestFromJson(jsonString);

import 'dart:convert';

GetModuleListByProductRequest getModuleListByProductRequestFromJson(
        String str) =>
    GetModuleListByProductRequest.fromJson(json.decode(str));

String getModuleListByProductRequestToJson(
        GetModuleListByProductRequest data) =>
    json.encode(data.toJson());

class GetModuleListByProductRequest {
  String tokenNo;
  String projectId;

  GetModuleListByProductRequest({
    required this.tokenNo,
    required this.projectId,
  });

  factory GetModuleListByProductRequest.fromJson(Map<String, dynamic> json) =>
      GetModuleListByProductRequest(
        tokenNo: json["tokenNo"],
        projectId: json["projectId"],
      );

  Map<String, dynamic> toJson() => {
        "tokenNo": tokenNo,
        "projectId": projectId,
      };
}
