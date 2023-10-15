import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/presentation/home/screen/home_screen.dart';
import 'package:todo/presentation/task/controller/edit_task_controller.dart';

class EditTaskSubmitButton extends StatelessWidget {
  final EditTaskController controller;
  final TaskEntity task;

  const EditTaskSubmitButton(
      {super.key, required this.controller, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        controller.updateTaskData(task);
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
            LangKeys.EDIT_TASK,
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
