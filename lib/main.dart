import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart';
import 'package:todo/presentation/features/home/screen/home_screen.dart';

void main() {
  Get.put(TaskController()); // Initialize the TaskController

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: appColor,
        fontFamily: 'Lato',
      ),
      home: const Scaffold(
        body: HomeScreen(),
      ),
    ),
  );
}
