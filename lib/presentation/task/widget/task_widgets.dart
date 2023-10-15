import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/presentation/task/controller/edit_task_controller.dart';
import 'package:todo/presentation/task/widget/edit_task_screen_buttons.dart';
import 'package:todo/presentation/task/widget/edit_task_submit_button.dart';
import 'package:todo/presentation/task/widget/edit_task_time.dart';
import 'package:todo/presentation/task/widget/edit_title_decription.dart';

class TaskWidgets extends StatelessWidget {
  final EditTaskController controller = Get.find();
  final TaskEntity task;

  TaskWidgets({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditTaskTitleDescription(
                    title: task.title,
                    description: task.description,
                  ),
                  EditTaskTime(
                    date: task.date,
                    time: task.time,
                    timeCallback: () => controller.pickDateTime(context),
                  ),
                  EditTaskScreenButtons(
                    controller: controller,
                    task: task,
                  ),
                ],
              ),
            ),
          ),
          EditTaskSubmitButton(
            controller: controller,
            task: task,
          ),
        ],
      ),
    );
  }
}
