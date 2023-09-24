import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/data/sqldb.dart';

class HomeController extends GetxController {
  SqlDb sqlDb = SqlDb();
  RxBool isButtonPressed = false.obs;
  RxString taskTitle = "".obs;
  RxString taskDescription = "".obs;
  RxString taskDate = "".obs;
  RxString taskTime = "".obs;
  RxInt recordCount = 0.obs;
  RxString searchQuery = ''.obs;
  RxList<Map<dynamic, dynamic>> filteredTasks = RxList<Map<dynamic, dynamic>>();
  RxInt selectedTaskIndex = (-1).obs;
  RxString selectedFilter = 'All'.obs;
  RxList<Map<dynamic, dynamic>> tasks = RxList<Map<dynamic, dynamic>>();

  @override
  void onInit() {
    super.onInit();
    filterTasks();
  }

  Future<void> insertNewTask(BuildContext context) async {
    int response = await sqlDb.insertData(
        ''' INSERT INTO Tasks (taskTitle, taskDescription, taskDate, taskTime, taskCategory, taskPrivacy)
       VALUES ('$taskTitle', '$taskDescription', '$taskDate', '$taskTime', 'Home', 0) ''');

    final scaffoldMessenger = ScaffoldMessenger.of(context);

    if (response > 0) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Task added successfully.'),
          duration: Duration(seconds: 2),
        ),
      );

      // Fetch the updated list of tasks
      List<Map<dynamic, dynamic>> updatedTasks = await readAllTasks();

      // Update the filteredTasks with the updated list
      filteredTasks.assignAll(updatedTasks);
    } else {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text('Task insertion failed.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<List<Map<dynamic, dynamic>>> readAllTasks() async {
    List<Map<dynamic, dynamic>> response =
        await sqlDb.readData("SELECT * FROM 'Tasks'");
    return response;
  }

  Future<int> readTotalTableRecords() async {
    List<Map<dynamic, dynamic>> response =
        await sqlDb.readData("SELECT COUNT(*) as count FROM 'Tasks'");

    if (response.isNotEmpty) {
      int count = response[0]['count'];
      recordCount.value = count;
      return count;
    } else {
      return 0;
    }
  }

  bool isToday(String taskDate) {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    return taskDate == formattedDate;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterTasks();
  }

  Future<void> filterTasks() async {
    final List<Map<dynamic, dynamic>> allTasks = await readAllTasks();

    final query = searchQuery.value.toLowerCase();
    final newFilteredTasks = query.isEmpty
        ? allTasks
        : allTasks.where((task) {
            final taskTitle = task['taskTitle'].toString().toLowerCase();
            return taskTitle.contains(query);
          }).toList();

    // Apply filtering based on the selected choice
    switch (selectedFilter.value) {
      case 'All':
        filteredTasks.assignAll(newFilteredTasks);
        break;
      case 'Completed':
        filteredTasks.assignAll(
            newFilteredTasks.where((task) => task['taskCompletion'] == 1));
        break;
      case 'Today':
        filteredTasks.assignAll(
            newFilteredTasks.where((task) => isToday(task['taskDate'])));
        break;
    }
  }

  void updateTaskCompletion(int taskId, bool completed) async {
    int completionValue = completed ? 1 : 0;

    // Find the index of the task with the given taskId in the filteredTasks list
    int taskIndex = filteredTasks.indexWhere((task) => task['id'] == taskId);

    if (taskIndex != -1) {
      // Create a copy of the task with the updated completion value
      Map<String, dynamic> updatedTask = Map.from(filteredTasks[taskIndex]);
      updatedTask['taskCompletion'] = completionValue;

      // Update the task in the filteredTasks list with the updated copy
      filteredTasks[taskIndex] = updatedTask;

      // Update the database as well (your existing code to update the database)
      int response = await sqlDb.updateData(''' UPDATE Tasks 
      SET taskCompletion = $completionValue 
      WHERE id = $taskId
    ''');

      if (response > 0) {
        // Task completion status updated successfully.
      } else {
        // Task completion status update failed.
      }
    }
  }
}
