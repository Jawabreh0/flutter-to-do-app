import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/features/category/screen/category_screen.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart';

void main() {
  Get.put(HomeController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: appColor,
        fontFamily: 'Lato',
      ),
      home: const Scaffold(
        body: CategoryScreen(),
      ),
    ),
  );
}
