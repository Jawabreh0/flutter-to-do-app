import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';
import 'package:todo/presentation/task/controller/edit_task_controller.dart';

class EditTaskTitleDescription extends StatelessWidget {
  final EditTaskController controller = Get.find();
  final String title;
  final String description;

  EditTaskTitleDescription(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        taskTitleRow(title),
        const SizedBox(height: 15),
        taskDescriptionRow(description),
      ],
    );
  }

  Widget taskTitleRow(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 28, right: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          editIcon(),
        ],
      ),
    );
  }

  Widget taskDescriptionRow(String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 28, bottom: 35),
      child: Row(
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
              color: hintFontColor,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget editIcon() {
    return IconButton(
      icon: const BuildSvgIcon(assetKey: AssetKeys.editIcon),
      onPressed: () => showEditDialog(title, description),
    );
  }

  void showEditDialog(String title, String description) {
    controller.titleController.text = title;
    controller.descriptionController.text = description;
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bottomSheetColor,
          title: Column(
            children: [
              const Center(
                child: Text(
                  LangKeys.EDIT_TASK_TITLE,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                color: fieldBordersColor,
                thickness: 1,
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: TextField(
                    controller: controller.titleController,
                    onChanged: (value) {},
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: LangKeys.TASK_TITLE,
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
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    ),
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: TextField(
                    controller: controller.descriptionController,
                    onChanged: (value) {},
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: LangKeys.TASK_DESCRIPTION,
                      hintStyle: TextStyle(
                        color: hintFontColor,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: bottomSheetColor,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          LangKeys.CANCEL,
                          style: TextStyle(
                            fontSize: 18,
                            color: appSecondaryColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appSecondaryColor,
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          LangKeys.EDIT,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
