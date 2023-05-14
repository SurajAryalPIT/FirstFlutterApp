import 'package:flutter/material.dart';
import 'package:supporttools/views/home_screen.dart';
import 'package:supporttools/views/login_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Support Tools",
    home: LoginScreen(),
  ));
}
