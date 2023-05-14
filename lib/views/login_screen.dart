import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supporttools/controlers/login_controller.dart';
import 'package:supporttools/models/login_request_model.dart';
import 'package:supporttools/models/login_response_models.dart';
import 'package:supporttools/views/home_screen.dart';

import '../config.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController _cEmail = TextEditingController();

  TextEditingController _cPassword = TextEditingController();

  void changeIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://cdn.pixabay.com/photo/2018/09/17/23/21/imagination-3685048_1280.png",
                  height: 50,
                  width: 50,
                ),
                TextField(
                  controller: _cEmail,
                  decoration: const InputDecoration(hintText: "Enter email"),
                ),
                TextField(
                  controller: _cPassword,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Enter Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    height: 50,
                    minWidth: 100,
                    color: Colors.blue,
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                    onPressed: () async {
                      if (!isLoading) {
                        changeIsLoading();
                        if (_cEmail.text == "" || _cPassword.text.isEmpty) {
                        } else {
                          LoginController loginController = LoginController();
                          LoginRequestModel loginRequestModel =
                              LoginRequestModel(
                                  initial: "live",
                                  userName: _cEmail.text,
                                  password: _cPassword.text,
                                  machineName: "");
                          LoginResponseModel loginresponsemodel =
                              await loginController.login(loginRequestModel);
                          APPConfig.TOKEN_NO = loginresponsemodel.data.tokenNo;
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(loginresponsemodel)),
                          );
                          changeIsLoading();
                        }
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
