import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:get/get.dart';
import 'package:to_do/presentation/features/modify_task/controller/modify_task_controller.dart';

class ModifyTaskWidgets {
  static Widget modifyTaskAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: true, // Set this to true or false as needed
      actions: [
        Container(
          margin: const EdgeInsets.only(bottom: 25, top: 0),
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
    return Column(children: [
      modifyTitleDescription(),
    ]);
  }

  static Widget modifyTitleDescription() {
    final taskDetails = Get.arguments;
    final ModifyTaskController controller =
        Get.put(ModifyTaskController(taskDetails));
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 28, right: 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  "${controller.taskTitle.value}", // Use controller's taskTitle
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  width: 48,
                  height: 48,
                ),
                onPressed: () {
                  // Show the dialog when the icon button is pressed
                  showDialog(
                    context: Get.context!,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: bottomSheetColor,
                        title: Column(
                          children: [
                            const Center(
                              child: Text(
                                'Choose Category',
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
                        content: Row(
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
                                  // TODO: Handle Choose button
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: appSecondaryColor,
                                  padding: EdgeInsets.zero,
                                ),
                                child: const Text(
                                  'Choose',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
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
        ),
        Padding(
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
        ),
        Padding(
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
        ),
        modifyTaskButtons(),
      ],
    );
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
}
