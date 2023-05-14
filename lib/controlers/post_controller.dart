import 'package:http/http.dart' as http;
import 'package:supporttools/models/login_request_model.dart';
import 'package:supporttools/models/login_response_models.dart';

import '../config.dart';
import '../models/get_project_response_model.dart';
import '../utils/utils.dart';

class PostController {
  // Get Project Listing
  static Future<GetProjectResponseModel> getProjectListing() async {
    try {
      final response = await http.post(
        Uri.parse("${APPConfig.BASE_URL}PosLogin/GetProjectList"),
        body: {"tokenNo": APPConfig.TOKEN_NO},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
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
