import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/core/app-colors/palette.dart';
import '../controller/catg_ctrl.dart';

class CreateCatgWidget {
  static Widget createCatgBody() {
    return Container(
      color: appColor, // Set the background color to black
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          catgNameText(),
          catgNameField(),
          catgIconText(),
          chooseCatgButton(),
          catgColorText(),
          chooseColor(),
          const Spacer(),
          createCatgButton(),
        ],
      ),
    );
  }

  static Widget catgNameText() {
    return const Padding(
        padding: EdgeInsets.only(top: 20, left: 24),
        child: Text(
          "Category name :",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  static Widget catgNameField() {
    final CatgController controller = Get.put(CatgController());
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
      child: TextField(
        onChanged: (value) {
          controller.catgName.value = value;
        },
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Category name',
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

  static Widget catgIconText() {
    return const Padding(
        padding: EdgeInsets.only(top: 20, left: 24, bottom: 16),
        child: Text(
          "Category icon :",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  static Widget chooseCatgButton() {
    final CatgController controller = Get.put(CatgController());
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 20),
      child: ElevatedButton(
        onPressed: () {
          Get.defaultDialog(
            backgroundColor: bottomSheetColor,
            title: 'Choose an Icon',
            titleStyle: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
            content: SizedBox(
              width: double.maxFinite,
              height: 250,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      color: fieldBordersColor,
                      thickness: 1,
                    ),
                    const SizedBox(height: 30),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (controller.iconList.length / 3).ceil(),
                      itemBuilder: (BuildContext context, int rowIndex) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                for (int i = rowIndex * 3;
                                    i < (rowIndex * 3 + 3);
                                    i++)
                                  if (i < controller.iconList.length)
                                    InkWell(
                                      onTap: () {
                                        IconData selectedIcon =
                                            controller.iconList[i];
                                        controller
                                            .handleSelectedButton(selectedIcon);
                                        Get.back(result: selectedIcon);
                                      },
                                      child: Icon(
                                        controller.iconList[i],
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                              ],
                            ),
                            const SizedBox(height: 50),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ).then((value) {
            if (value != null) {
              IconData selectedIcon = value;
              // Do something with the selected icon
            }
          });
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          backgroundColor: bottomSheetColor,
        ),
        child: const Text(
          'Choose icon from library',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  static Widget catgColorText() {
    return const Padding(
        padding: EdgeInsets.only(bottom: 16, left: 24),
        child: Text(
          "Category color :",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ));
  }

  static Widget chooseColor() {
    final CatgController controller = Get.put(CatgController());
    return Padding(
        padding: const EdgeInsets.only(left: 24),
        child: SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.colorsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: InkWell(
                  onTap: () {
                    controller.changeColor(controller.colorsList[index]);
                  },
                  child: Obx(() {
                    return Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: controller.colorsList[index],
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: controller.selectedColor.value ==
                                  controller.colorsList[index]
                              ? Colors.black
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ));
  }

  static Widget createCatgButton() {
    final CatgController controller = Get.put(CatgController());
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
                minimumSize: const Size(0, 50), // Set the minimum height
              ),
              child: Text(
                'Cancel',
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
                controller.printFun();
                IconData? selectedIcon = controller.selectedIcon.value;
                if (selectedIcon != null) {
                  controller.handleSelectedButton(selectedIcon);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appSecondaryColor,
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 50), // Set the minimum height
              ),
              child: const Text(
                'Create Category',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
