// To parse this JSON data, do
//
//     final postRecordModel = postRecordModelFromJson(jsonString);

import 'dart:convert';

PostRecordModel postRecordModelFromJson(String str) =>
    PostRecordModel.fromJson(json.decode(str));

String postRecordModelToJson(PostRecordModel data) =>
    json.encode(data.toJson());

class PostRecordModel {
  String tokenNo;
  String projectCategory;
  String projectSubModule;
  String enquiryFrom;
  String severity;
  String priority;
  String reportStay;
  String summary;
  String description;
  String uploadFile;
  int viewStatus;
  String assignTo;

  PostRecordModel({
    required this.tokenNo,
    required this.projectCategory,
    required this.projectSubModule,
    required this.enquiryFrom,
    required this.severity,
    required this.priority,
    required this.reportStay,
    required this.summary,
    required this.description,
    required this.uploadFile,
    required this.viewStatus,
    required this.assignTo,
  });

  factory PostRecordModel.fromJson(Map<String, dynamic> json) =>
      PostRecordModel(
        tokenNo: json["tokenNo"],
        projectCategory: json["projectCategory"],
        projectSubModule: json["projectSubModule"],
        enquiryFrom: json["enquiryFrom"],
        severity: json["severity"],
        priority: json["priority"],
        reportStay: json["reportStay"],
        summary: json["summary"],
        description: json["description"],
        uploadFile: json["uploadFile"],
        viewStatus: json["ViewStatus"],
        assignTo: json["assignTo"],
      );

  Map<String, dynamic> toJson() => {
        "tokenNo": tokenNo,
        "projectCategory": projectCategory,
        "projectSubModule": projectSubModule,
        "enquiryFrom": enquiryFrom,
        "severity": severity,
        "priority": priority,
        "reportStay": reportStay,
        "summary": summary,
        "description": description,
        "uploadFile": uploadFile,
        "ViewStatus": viewStatus,
        "assignTo": assignTo,
      };
}
