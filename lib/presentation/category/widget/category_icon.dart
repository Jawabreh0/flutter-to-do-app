import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';

class CategoryIconSelection extends StatelessWidget {
  final CategoryController categoryController;

  const CategoryIconSelection({super.key, required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        catgIconText(),
        iconDropDown(),
      ],
    );
  }

  Widget catgIconText() {
    return const Padding(
        padding: EdgeInsets.only(top: 20, left: 24, bottom: 16),
        child: Text(
          LangKeys.CATEGORY_ICON_,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  Widget iconDropDown() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: bottomSheetColor,
            elevation: 0,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<IconData>(
              hint: categoryController.selectedIcon.value == null
                  ? const Text(
                      LangKeys.CHOOSE_AN_ICON,
                      style: TextStyle(color: Colors.white),
                    )
                  : const SizedBox.shrink(),
              value: categoryController.selectedIcon.value,
              iconSize: 0.0,
              dropdownColor: bottomSheetColor,
              onChanged: (IconData? newValue) {
                if (newValue != null) {
                  categoryController.updateIcon(newValue);
                }
              },
              items: categoryController.preDefinedIcons
                  .map<DropdownMenuItem<IconData>>((IconData icon) {
                return DropdownMenuItem<IconData>(
                  value: icon,
                  child: Icon(icon, color: Colors.white),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
