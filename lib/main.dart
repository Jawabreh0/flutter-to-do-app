import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart';
import 'package:todo/presentation/features/login/screen/login_screen.dart';

void main() {
  Get.put(TaskController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: appColor,
        fontFamily: 'Lato',
      ),
      home: Scaffold(
        body: LoginScreen(),
      ),
    ),
  );
}
