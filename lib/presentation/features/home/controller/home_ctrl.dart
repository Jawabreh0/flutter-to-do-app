import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/domain/entities/task_entity.dart';
import 'package:todo/domain/interactors/task_interactor.dart';

class TaskController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  final tasks = <Task>[].obs;
  final taskCount = 0.obs;

  final TaskInteractor _taskInteractor = TaskInteractor();

  void addTask() {
    final title = taskTitleController.text;
    final description = taskDescriptionController.text;
    final date = DateFormat('dd-MMMM-yyyy').format(selectedDate.value);
    final time = "${selectedTime.value.hour}:${selectedTime.value.minute}";
    _taskInteractor.addTask(title, description, date, time);
    fetchTasks();
    taskTitleController.clear();
    taskDescriptionController.clear();
    Get.back();
  }

  Future<void> fetchTasks() async {
    List<Task> fetchedTasks = await _taskInteractor.getTasks();
    tasks.value = fetchedTasks;
    taskCount.value = fetchedTasks.length;
  }

  void updateTaskCompletion(int id, bool completed) {
    _taskInteractor.updateTaskCompletion(id, completed);
    fetchTasks();
  }
}
