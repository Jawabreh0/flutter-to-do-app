import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:get/get.dart';
import 'package:to_do/presentation/features/home/screen/home_screen.dart';
import 'package:to_do/presentation/features/modify_task/controller/modify_task_controller.dart';

class ModifyTaskWidgets {
  static Widget modifyTaskAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: modifyTaskColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: IconButton(
            padding: EdgeInsets.zero, // Remove the IconButton's padding
            onPressed: () {
              Get.offAll(HomeScreen());
            },
            icon: SvgPicture.asset(
              'assets/icons/cancel-icon.svg',
              width: 24, // Decrease the width and height
              height: 24,
            ),
          ),
        ),
        Container(
          width: 120, // Adjust the width
          height: 35, // Adjust the height
          decoration: BoxDecoration(
            color: modifyTaskColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "Mark as Complete",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget modifyTaskkBody() {
    return SingleChildScrollView(
        child: Column(
      children: [
        taskTitleRow(),
        const SizedBox(height: 15),
        taskDescriptionRow(),
        taskTimeRow(),
        taskCategoryRow(),
        modifyTaskButtons(),
      ],
    ));
  }

  static Widget modifyTaskButtons() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Divider(
              color: fieldBordersColor,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: SvgPicture.asset(
                'assets/icons/share.svg',
                width: 24,
                height: 24,
              ),
              label: const Text('Share task'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
                width: 24,
                height: 24,
              ),
              label: const Text('Calendar'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: SvgPicture.asset(
                'assets/icons/trash.svg',
                width: 24,
                height: 24,
              ),
              label: Text(
                'Delete Task',
                style: TextStyle(color: deleteTaskRedColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget taskTitleRow() {
    final taskDetails = Get.arguments;
    final ModifyTaskController controller =
        Get.put(ModifyTaskController(taskDetails));
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 28, right: 36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () => Text(
              "${controller.taskTitle.value}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          editIcon(),
        ],
      ),
    );
  }

  static Widget editIcon() {
    final taskDetails = Get.arguments;
    final ModifyTaskController controller =
        Get.put(ModifyTaskController(taskDetails));
    final ModifyTaskController editTaskController =
        Get.find<ModifyTaskController>();
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/edit.svg',
        width: 48,
        height: 48,
      ),
      onPressed: () {
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: bottomSheetColor,
              title: Column(
                children: [
                  const Center(
                    child: Text(
                      'Edit Task title',
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
                  mainAxisSize: MainAxisSize
                      .min, // Ensure the dialog size fits the content
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: TextField(
                        onChanged: (value) {
                          editTaskController.taskTitle.value = value;
                        },
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "${controller.taskTitle.value}",
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
                        onChanged: (value) {
                          editTaskController.taskDescription.value = value;
                        },
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "${controller.taskDescription.value}",
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
                              // TODO: Handle Cancel button
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: bottomSheetColor,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Cancel',
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
                              final newTitle =
                                  editTaskController.taskTitle.value;
                              final newDescription =
                                  editTaskController.taskDescription.value;
                              controller.updateTaskInDatabase(
                                  newTitle, newDescription);
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appSecondaryColor,
                              padding: EdgeInsets.zero,
                            ),
                            child: const Text(
                              'Edit',
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
      },
    );
  }

  static Widget taskDescriptionRow() {
    final taskDetails = Get.arguments;
    final ModifyTaskController controller =
        Get.put(ModifyTaskController(taskDetails));
    return Padding(
      padding: const EdgeInsets.only(left: 28, bottom: 35),
      child: Row(
        children: [
          Obx(
            () => Text(
              "${controller.taskDescription.value}", // Use controller's taskTitle
              style: TextStyle(
                fontSize: 20,
                color: hintFontColor,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  static Widget taskTimeRow() {
    final taskDetails = Get.arguments;
    final ModifyTaskController controller =
        Get.put(ModifyTaskController(taskDetails));
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/timer-icon.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                "Task Time :",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(bottomSheetColor),
            ),
            child: Obx(
              () => Text(
                "${controller.taskDate.value} At ${controller.taskTime.value}", // Use controller's taskTitle
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget taskCategoryRow() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/tag-icon.svg',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                "Task Category :",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(bottomSheetColor),
            ),
            child: const Text("University"),
          ),
        ],
      ),
    );
  }
}
