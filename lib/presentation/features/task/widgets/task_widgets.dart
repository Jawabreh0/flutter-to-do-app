import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/mixins/snackbar_mixin.dart';
import 'package:todo/core/presentation/widgets/build_svg_icon.dart';
import 'package:todo/domain/entities/task_entity.dart';
import 'package:todo/domain/interactors/task_interactor.dart';
import 'package:todo/presentation/features/home/screen/home_screen.dart';
import 'package:todo/presentation/features/task/controller/task_ctrl.dart';

class TaskWidget extends StatelessWidget with SnackbarMixin {
  final Task task;
  final controller = Get.put(TaskController(TaskInteractor()));

  TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                taskTitleRow(task.title),
                const SizedBox(height: 15),
                taskDescriptionRow(task.description),
                taskTimeRow(task.date, task.time),
                taskActionButtons(),
              ],
            ),
          ),
        ),
        editTaskSubmitButton(),
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

  Widget editIcon() {
    final controller = Get.put(TaskController(TaskInteractor()));

    return IconButton(
      icon: const BuildSvgIcon(assetKey: AssetKeys.editIcon),
      onPressed: () {
        controller.titleController.text = task.title;
        controller.descriptionController.text = task.description;
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
                        controller: controller.titleController,
                        onChanged: (value) {},
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Task Title",
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
                          hintText: "Task Description",
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
                              Get.back();
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
      }, // Added missing closing parenthesis here
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

  Widget taskTimeRow(String date, String time) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              BuildSvgIcon(assetKey: AssetKeys.timerIcon),
              SizedBox(width: 8),
              Text(
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
              DateTime? selectedDate = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2101),
              );

              if (selectedDate != null) {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: Get.context!,
                  initialTime: TimeOfDay.now(),
                );

                if (selectedTime != null) {
                  controller.setDateAndTime(
                    selectedDate,
                    selectedTime,
                  );
                }
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(bottomSheetColor),
            ),
            child: Text(
              "$date At $time",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget taskCategoryRow(String category) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              BuildSvgIcon(assetKey: AssetKeys.tagIcon),
              SizedBox(width: 8),
              Text(
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
            child: Text(category),
          ),
        ],
      ),
    );
  }

  Widget taskActionButtons() {
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
            padding: const EdgeInsets.only(left: 25),
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: const BuildSvgIcon(assetKey: AssetKeys.shareIcon),
              label: const Text(LangKeys.SHARE_TASK),
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
              icon: const BuildSvgIcon(assetKey: AssetKeys.calenderIcon),
              label: const Text(LangKeys.CALENDER),
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
              icon: const BuildSvgIcon(assetKey: AssetKeys.trashIcon),
              label: Text(
                LangKeys.DELETE_TASK,
                style: TextStyle(color: deleteTaskRedColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget editTaskSubmitButton() {
    final controller = Get.find<TaskController>();

    return GestureDetector(
      onTap: () {
        controller.updateTask(
          task.id,
          task.date,
          task.time,
        );
        showSnackbar(LangKeys.SUCCESS, "Task Added Successfully");
        Get.offAll(const HomeScreen());
      },
      child: Container(
        width: double.infinity,
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
