import 'package:get/get.dart';

class ModifyTaskController extends GetxController {
  // Define variables to store the task details
  RxString taskTitle = ''.obs;
  RxString taskDescription = ''.obs;
  RxString taskDate = ''.obs;
  RxString taskTime = ''.obs;

  // Constructor to initialize the task details from arguments
  ModifyTaskController(Map<String, dynamic> taskDetails) {
    // Initialize the task details from the arguments
    taskTitle.value = taskDetails['taskTitle'];
    taskDescription.value = taskDetails['taskDescription'];
    taskDate.value = taskDetails['taskDate'];
    taskTime.value = taskDetails['taskTime'];
  }

  // Method to update the task details
  void updateTaskDetails({
    String? title,
    String? description,
    String? date,
    String? time,
  }) {
    // Update the task details
    if (title != null) taskTitle.value = title;
    if (description != null) taskDescription.value = description;
    if (date != null) taskDate.value = date;
    if (time != null) taskTime.value = time;
  }

  // Method to save the modified task details
  void saveTask() {
    // You can implement the logic to save the task details here
    // For example, you can send an API request to update the task on the server
    // or update a local database.

    // After saving, you can navigate back to the previous screen
    Get.back();
  }
}
