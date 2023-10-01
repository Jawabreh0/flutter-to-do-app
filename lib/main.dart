import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/domain/interactor_impl/category_impl.dart';
import 'package:todo/domain/interactors/category_interactor.dart';
import 'package:todo/presentation/features/category/controller/category_ctrl.dart';
import 'package:todo/presentation/features/category/screen/category_screen.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart';

void main() {
  final categoryRepository = MemoryCategoryRepository();
  final createCategory = CreateCategory(categoryRepository);
  final categoryController = CategoryController(createCategory);

  Get.put(categoryController);
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
