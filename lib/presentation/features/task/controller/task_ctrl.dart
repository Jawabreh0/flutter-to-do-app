import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/domain/interactors/task_interactor.dart';

class TaskController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final TaskInteractor _taskInteractor;

  TaskController(this._taskInteractor);

  void updateTask(int taskId) {
    final newTitle = titleController.text.trim();
    final newDescription = descriptionController.text.trim();

    // Validation can be done here
    if (newTitle.isNotEmpty && newDescription.isNotEmpty) {
      _taskInteractor.updateTask(
        taskId,
        newTitle,
        newDescription,
      );
    }
  }
}
