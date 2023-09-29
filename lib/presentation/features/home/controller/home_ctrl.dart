import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/domain/entities/task_entity.dart';
import 'package:todo/domain/interactors/task_interactor.dart';

class TaskController extends GetxController {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  final tasks = <Task>[].obs;

  final TaskInteractor _taskInteractor = TaskInteractor();

  void addTask() {
    final title = taskTitleController.text;
    final description = taskDescriptionController.text;
    final date = selectedDate.value.toIso8601String();
    final time = "${selectedTime.value.hour}:${selectedTime.value.minute}";

    _taskInteractor.addTask(title, description, date, time);
  }
}
