import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/domain/entities/task_entity.dart';
import 'package:todo/domain/interactors/task_interactor.dart';

class HomeController extends GetxController {
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
  final isLoading = true.obs;
  final filteredTasks = <Task>[].obs;
  final RxString currentFilter = 'All'.obs;

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
    isLoading.value = true;
    List<Task> fetchedTasks = await _taskInteractor.getTasks();
    tasks.value = fetchedTasks;
    applyFilter();
    isLoading.value = false;
    taskCount.value = fetchedTasks.length;
  }

  void applyFilter() {
    if (currentFilter.value == 'All') {
      filteredTasks.value = tasks;
    } else if (currentFilter.value == 'Completed') {
      filteredTasks.value = tasks.where((task) => task.completed).toList();
    } else if (currentFilter.value == 'Today') {
      String today = DateFormat('dd-MMMM-yyyy').format(DateTime.now());
      filteredTasks.value = tasks.where((task) => task.date == today).toList();
    }
  }

  void updateTaskCompletion(int id, bool completed) {
    _taskInteractor.updateTaskCompletion(id, completed);
    fetchTasks();
  }

  void searchTask(String query) {
    if (query.isEmpty) {
      filteredTasks.value = tasks;
    } else {
      filteredTasks.value = tasks
          .where(
              (task) => task.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
