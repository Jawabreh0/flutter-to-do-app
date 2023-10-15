import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';
import 'package:todo/presentation/category/widget/categgory_color.dart';
import 'package:todo/presentation/category/widget/category_icon.dart';
import 'package:todo/presentation/category/widget/category_name.dart';
import 'package:todo/presentation/category/widget/create_category_button.dart';

class CategoryWidgets extends StatelessWidget {
  final CategoryController categoryController = Get.find();

  CategoryWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryName(categoryController: categoryController),
          CategoryIconSelection(categoryController: categoryController),
          CategoryColorSelection(categoryController: categoryController),
          CreateCategoryButton(categoryController: categoryController),
        ],
      ),
    );
  }
}
