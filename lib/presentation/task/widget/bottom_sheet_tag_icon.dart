import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';
import 'package:todo/presentation/category/screen/caegory_screen.dart';
import 'package:todo/presentation/task/controller/bottom_sheet_controller.dart';

class TagIconButton extends StatelessWidget {
  final BottomSheetController controller;

  const TagIconButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find();

    return IconButton(
      icon: const BuildSvgIcon(assetKey: AssetKeys.tagIcon),
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: bottomSheetColor,
              title: const Center(
                child: Text(
                  LangKeys.SELECT_A_CATEGORY,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              titlePadding: const EdgeInsets.only(top: 25),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const Divider(color: Colors.white),
                    SizedBox(
                      width: double.maxFinite,
                      height: 250,
                      child: GridView.count(
                        mainAxisSpacing: 15.0,
                        crossAxisSpacing: 10.0,
                        crossAxisCount: 3,
                        children: [
                          ...categoryController.categories.map((category) {
                            return GestureDetector(
                              onTap: () {
                                controller.setSelectedCategoryId(category.id);
                              },
                              child: _buildCategoryItem(category),
                            );
                          }).toList(),
                          GestureDetector(
                            onTap: () {
                              Get.to(const CategoryScreen());
                            },
                            child: _buildNewCategoryItem(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bottomSheetColor,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          controller.setSelectedCategoryId(null);
                          Get.back();
                        },
                        child: const Text(LangKeys.CANCEL,
                            style: TextStyle(fontSize: 16)),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appSecondaryColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          LangKeys.CHOOSE,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
      color: Colors.white,
    );
  }

  Widget _buildCategoryItem(category) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: category.colorCode,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              IconData(category.iconCode, fontFamily: 'MaterialIcons'),
              color: Colors.white,
            ),
          ),
        ),
        Text(
          category.name,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildNewCategoryItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: weirdGreen,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.add,
              color: secondWeirdGreen,
            ),
          ),
        ),
        const Text(
          LangKeys.CREATE_NEW,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
