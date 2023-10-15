import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';
import 'package:todo/presentation/home/screen/home_screen.dart';

class CreateCategoryButton extends StatelessWidget {
  final CategoryController categoryController;

  const CreateCategoryButton({super.key, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return createCatgButton();
  }

  Widget createCatgButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.offAll(const HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appColor,
                elevation: 0,
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 50),
              ),
              child: Text(
                LangKeys.CANCEL,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: appSecondaryColor),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                categoryController.saveCategory();
                Get.offAll(const HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appSecondaryColor,
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 50),
              ),
              child: const Text(
                LangKeys.CREATE_CATEGORY,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
