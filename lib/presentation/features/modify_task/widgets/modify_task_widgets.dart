import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:get/get.dart';
import 'package:to_do/presentation/features/home/screen/home_screen.dart';
import 'package:to_do/presentation/features/modify_task/controller/modify_task_controller.dart';
//import 'package:share/share.dart';

import 'package:intl/intl.dart';

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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                taskTitleRow(),
                const SizedBox(height: 15),
                taskDescriptionRow(),
                taskTimeRow(),
                taskCategoryRow(),
                modifyTaskButtons(),
              ],
            ),
          ),
        ),
        editTaskButton(),
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
              onPressed: () {
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      /*
                      final taskDetails =
                          Get.arguments; // Retrieve the task details

                      if (taskDetails != null) {
                        final ModifyTaskController controller =
                            Get.put(ModifyTaskController(taskDetails));

                        // Create a message to share with task details
                        final sharedMessage =
                            "Task Title: ${controller.taskTitle.value}\n"
                            "Task Description: ${controller.taskDescription.value}\n"
                            "Task Date: ${controller.taskDate.value}\n"
                            "Task Time: ${controller.taskTime.value}";

                        // Show the share dialog
                        Share.share(sharedMessage);
                      }*/
                    },
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
                );
              },
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
              onPressed: () {
                /* 
                showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Confirm Deletion'),
      content: Text('Are you sure you want to delete this task?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            deleteTask(taskId); // Call the delete task function
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Delete'),
        ),
      ],
    );
  },
);

                 */
              },
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
    if (taskDetails != null) {
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
    } else {
      return const Center(
        child: Text(
          'Task details are not available',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      );
    }
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
    if (taskDetails != null) {
      final ModifyTaskController controller =
          Get.put(ModifyTaskController(taskDetails));
      return Padding(
        padding: const EdgeInsets.only(left: 28, bottom: 35),
        child: Row(
          children: [
            Obx(
              () => Text(
                "${controller.taskDescription.value}",
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
    } else {
      return const Center(
        child: Text(
          'Task details are not available',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      );
    }
  }

  static Widget taskTimeRow() {
    final ModifyTaskController editDateTimeController =
        Get.find<ModifyTaskController>();
    final taskDetails = Get.arguments;
    if (taskDetails != null) {
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
              onPressed: () async {
                // Remove the unnecessary self-invoking function
                DateTime? selectedDate = await showDatePicker(
                  context: Get.context!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(3000),
                  builder: (BuildContext context, Widget? child) {
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  },
                );

                if (selectedDate != null) {
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: Get.context!,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child!,
                      );
                    },
                  );

                  if (selectedTime != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                    String formattedTime = selectedTime.format(Get.context!);
                    editDateTimeController.taskDate.value = formattedDate;
                    editDateTimeController.taskTime.value = formattedTime;
                  }
                }

                final newTime = editDateTimeController.taskTime.value;
                final newDate = editDateTimeController.taskDate.value;
                controller.updateTaskDateTime(newTime, newDate);
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(bottomSheetColor),
              ),
              child: Obx(
                () => Text(
                  "${controller.taskDate.value} At ${controller.taskTime.value}",
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
    } else {
      return const Center(
        child: Text(
          'Task details are not available',
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      );
    }
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

  static Widget editTaskButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity, // Take the screen width
        height: 50,
        margin: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
        decoration: BoxDecoration(
          color: appSecondaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            "Edit Task",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
