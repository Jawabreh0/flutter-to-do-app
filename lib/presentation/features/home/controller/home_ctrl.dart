import 'package:flutter/material.dart';

class HomeController {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  // Function to handle adding a new task
  void addTask() {
    String taskTitle = taskTitleController.text;
    String taskDescription = taskDescriptionController.text;

    //  Add your logic to handle adding the task to your data source (e.g., a list)
    // For now, let's print the task details as an example
    print("New Task Added - Title: $taskTitle, Description: $taskDescription");
  }

  // Dispose the controllers to avoid memory leaks
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
  }
}
