import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo/domain/interactors/task_interactor.dart';
import 'package:todo/domain/entities/task_entity.dart';

class TaskController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late Task task;

  final TaskInteractor _taskInteractor;

  TaskController(this._taskInteractor);

  void setDateAndTime(DateTime date, TimeOfDay time) {
    selectedDate = date;
    selectedTime = time;
    update(); // This will rebuild GetX widgets if needed.
  }

  void updateTask(int taskId, String newDate, String newTime) {
    final newTitle = titleController.text.trim();
    final newDescription = descriptionController.text.trim();

    // Validation can be done here
    if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
      String formattedDate;
      if (selectedDate != null) {
        formattedDate = DateFormat('dd-MMMM-yyyy').format(selectedDate!);
      } else {
        formattedDate = newDate;
      }

      _taskInteractor.updateTask(
        taskId,
        newTitle,
        newDescription,
        formattedDate,
        selectedTime?.format(Get.context!) ?? newTime,
      );
    }
  }

  void shareTaskInfo(Task task) {
    final taskInfo = 'Task Title: ${task.title}\n'
        'Task Description: ${task.description}\n'
        'Task Date: ${task.date}\n'
        'Task Time: ${task.time}';

    Share.share(taskInfo);
  }

  void deleteTask(int taskId) {
    _taskInteractor.deleteTask(taskId);
  }
}
