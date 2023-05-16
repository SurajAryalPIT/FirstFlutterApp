import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:supporttools/models/login_request_model.dart';
import 'package:supporttools/models/login_response_models.dart';
import 'package:supporttools/models/module_list_request.dart';
import 'package:supporttools/models/module_list_response.dart';

import '../config.dart';
import '../models/common_request_token.dart';
import '../models/get_project_response_model.dart';
import '../utils/utils.dart';

class PostController {
  // Get Project Listing
  static Future<GetProjectResponseModel> getProjectListing() async {
    CommonRequestToken commonRequestToken =
        CommonRequestToken(tokenNo: APPConfig.TOKEN_NO);
    try {
      final response = await http.post(
        Uri.parse("${APPConfig.BASE_URL}PosLogin/GetProjectList"),
        body: commonRequestTokenToJson(commonRequestToken),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        GetProjectResponseModel projectResponseModel =
            getProjectResponseModelFromJson(response.body);
        return projectResponseModel;
      } else {
        Utils.showToast("Failed");
        throw Exception('Failed to get data.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Module Listing By Project ID
  static Future<GetModuleListByProductResponse> getModuleListing(
      int projectID) async {
    GetModuleListByProductRequest commonRequestToken =
        GetModuleListByProductRequest(
            tokenNo: APPConfig.TOKEN_NO, projectId: projectID.toString());
    try {
      final response = await http.post(
        Uri.parse("${APPConfig.BASE_URL}PosLogin/GetModuleListByProject"),
        body: getModuleListByProductRequestToJson(commonRequestToken),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        GetModuleListByProductResponse moduleResponseModel =
            getModuleListByProductResponseFromJson(response.body);
        return moduleResponseModel;
      } else {
        Utils.showToast("Failed");
        throw Exception('Failed to get data.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // CLient List

  // User List

  // Get single post
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    try {
      final response = await http.post(
        Uri.parse(APPConfig.BASE_URL + "PosLogin/ValidateUser"),
        body: loginRequestModelToJson(loginRequestModel),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel =
            loginResponseModelFromJson(response.body);
        return loginResponseModel;
      } else {
        Utils.showToast("Failed");
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
