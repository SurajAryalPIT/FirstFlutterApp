// To parse this JSON data, do
//
//     final getModuleListByProductResponse = getModuleListByProductResponseFromJson(jsonString);

import 'dart:convert';

GetModuleListByProductResponse getModuleListByProductResponseFromJson(
        String str) =>
    GetModuleListByProductResponse.fromJson(json.decode(str));

String getModuleListByProductResponseToJson(
        GetModuleListByProductResponse data) =>
    json.encode(data.toJson());

class GetModuleListByProductResponse {
  List<ModuleList> moduleList;
  int status;
  String message;
  int nextPage;

  GetModuleListByProductResponse({
    required this.moduleList,
    required this.status,
    required this.message,
    required this.nextPage,
  });

  factory GetModuleListByProductResponse.fromJson(Map<String, dynamic> json) =>
      GetModuleListByProductResponse(
        moduleList: List<ModuleList>.from(
            json["moduleList"].map((x) => ModuleList.fromJson(x))),
        status: json["status"],
        message: json["message"],
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "moduleList": List<dynamic>.from(moduleList.map((x) => x.toJson())),
        "status": status,
        "message": message,
        "nextPage": nextPage,
      };
}

class ModuleList {
  String ukId;
  String alias;

  ModuleList({
    required this.ukId,
    required this.alias,
  });

  factory ModuleList.fromJson(Map<String, dynamic> json) => ModuleList(
        ukId: json["UkId"],
        alias: json["Alias"],
      );

  Map<String, dynamic> toJson() => {
        "UkId": ukId,
        "Alias": alias,
      };
}
