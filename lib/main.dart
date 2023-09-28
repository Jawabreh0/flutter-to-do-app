import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/presentation/features/login/screen/login_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato', 
      ),
      home: Scaffold(
        body: LoginScreen(),
      ),
    ),
  );
}
