import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/presentation/error_dialog.dart';
import 'package:todo/domain/enitity/category_entity.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/domain/interactor/task_interactor.dart';
import 'package:intl/intl.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';
import 'package:todo/presentation/task/screen/edit_task_screen.dart';

// ignore: constant_identifier_names
enum TaskFilter { All, Completed, Today }

class HomeController extends GetxController {
  final TaskInteractor _taskInteractor;
  final RxList<TaskEntity> tasks = RxList<TaskEntity>();
  final RxList<TaskEntity> filteredTasks = RxList<TaskEntity>();
  final RxBool isLoading = true.obs;
  final CategoryController _categoryController;
  final RxInt taskCount = 0.obs;
  final Rx<TaskFilter> currentFilter = TaskFilter.All.obs;
  final DateFormat _dateFormat = DateFormat('dd-MM-yy');

  HomeController(this._taskInteractor, this._categoryController);

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    try {
      isLoading(true);
      List<TaskEntity> fetchedTasks = await _taskInteractor.getTasks();
      tasks.value = fetchedTasks;
      taskCount.value = tasks.length;
      _categoryController.fetchCategories();
      applyFilter(currentFilter.value);
      isLoading(false);
    } catch (e) {
      isLoading(false);
      ErrorDialog(errorMessage: e.toString());
    }
  }

  void searchTask(String query) {
    filteredTasks.value = tasks
        .where((task) => task.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void applyFilter(TaskFilter filter) {
    currentFilter.value = filter;
    switch (filter) {
      case TaskFilter.Completed:
        filteredTasks.value = tasks.where((task) => task.isCompleted).toList();
        break;
      case TaskFilter.Today:
        String todayStr = _dateFormat.format(DateTime.now());
        filteredTasks.value =
            tasks.where((task) => task.date == todayStr).toList();
        break;
      default:
        filteredTasks.value = tasks;
    }
  }

  Future<void> updateTaskCompletion(int id, bool value) async {
    try {
      int taskIndex = tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        tasks[taskIndex].isCompleted = value;
        await _taskInteractor.updateTask(tasks[taskIndex]);
        applyFilter(currentFilter.value);
      }
    } catch (e) {
      ErrorDialog(errorMessage: e.toString());
    }
  }

  CategoryEntity getCategoryForTask(TaskEntity task) {
    return _categoryController.categories.firstWhere(
      (c) => c.id == task.categoryId,
      orElse: () => CategoryEntity(
        id: null,
        name: 'Unknown',
        iconCode: Icons.error.codePoint,
        colorCode: Colors.white,
      ),
    );
  }

  void onTaskTap(TaskEntity task) {
    Get.to(() => EditTaskScreen(task: task));
  }
}
