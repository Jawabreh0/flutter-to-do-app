import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/domain/interactors/task_interactor.dart';

class TaskController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

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
}
