import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';

class CategoryColorSelection extends StatelessWidget {
  final CategoryController categoryController;

  const CategoryColorSelection({super.key, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        catgColorText(),
        colorSelectorRow(),
      ],
    );
  }

  Widget catgColorText() {
    return const Padding(
        padding: EdgeInsets.only(bottom: 16, left: 24),
        child: Text(
          LangKeys.CATEGORY_COLOR_,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  Widget colorSelectorRow() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 26),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              categoryController.preDefinedColors.length * 2 - 1,
              (index) {
                if (index % 2 == 0) {
                  int colorIndex = index ~/ 2;
                  Color color = categoryController.preDefinedColors[colorIndex];
                  bool isSelected =
                      categoryController.selectedColor.value == color;
                  return GestureDetector(
                    onTap: () => categoryController.updateColor(color),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      child: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  );
                } else {
                  return const SizedBox(width: 16);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
