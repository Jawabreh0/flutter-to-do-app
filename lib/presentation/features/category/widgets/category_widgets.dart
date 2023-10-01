import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/domain/interactor_impl/category_impl.dart';
import 'package:todo/domain/interactors/category_interactor.dart';
import 'package:todo/presentation/features/category/controller/category_ctrl.dart';

class CategoryWidgets extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController(
      CreateCategory(
          MemoryCategoryRepository()))); // Pass your actual dependencies here

  CategoryWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          catgNameText(),
          catgNameField(),
          catgIconText(),
          iconDropDown(),
          catgColorText(),
          colorSelectorRow(),
          createCatgButton(),
        ],
      ),
    );
  }

  Widget catgNameText() {
    return const Padding(
        padding: EdgeInsets.only(top: 20, left: 24),
        child: Text(
          LangKeys.CATEGORY_NAME,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  Widget catgNameField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
      child: TextField(
        controller: categoryController.textEditingController,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: LangKeys.CATEGORY_NAME,
          hintStyle: TextStyle(
            color: hintFontColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fieldBordersColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fieldBordersColor,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        ),
        autofocus: true,
      ),
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

  Widget createCatgButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
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
                categoryController
                    .create(); // Calling create method when button is pressed
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
                      "Choose icon from library",
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
              items: categoryController.iconsList
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

  Widget colorSelectorRow() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 26),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              categoryController.colorsList.length * 2 - 1,
              (index) {
                if (index % 2 == 0) {
                  int colorIndex = index ~/ 2;
                  Color color = categoryController.colorsList[colorIndex];
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
