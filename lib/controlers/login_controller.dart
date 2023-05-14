import 'package:http/http.dart' as http;
import 'package:supporttools/models/login_request_model.dart';
import 'package:supporttools/models/login_response_models.dart';

import '../config.dart';
import '../utils/utils.dart';

class LoginController {
  // Url of the API

  // Get single post
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
    try {
      final response = await http.post(
        Uri.parse("${APPConfig.BASE_URL}PosLogin/ValidateUser"),
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
