import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                const TextField(
                  decoration: InputDecoration(hintText: "Enter email"),
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Enter Password"),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                    height: 50,
                    minWidth: 100,
                    color: Colors.blue,
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
