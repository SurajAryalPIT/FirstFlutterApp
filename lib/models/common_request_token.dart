// To parse this JSON data, do
//
//     final commonRequestToken = commonRequestTokenFromJson(jsonString);

import 'dart:convert';

CommonRequestToken commonRequestTokenFromJson(String str) =>
    CommonRequestToken.fromJson(json.decode(str));

String commonRequestTokenToJson(CommonRequestToken data) =>
    json.encode(data.toJson());

class CommonRequestToken {
  String tokenNo;

  CommonRequestToken({
    required this.tokenNo,
  });

  factory CommonRequestToken.fromJson(Map<String, dynamic> json) =>
      CommonRequestToken(
        tokenNo: json["tokenNo"],
      );

  Map<String, dynamic> toJson() => {
        "tokenNo": tokenNo,
      };
}
