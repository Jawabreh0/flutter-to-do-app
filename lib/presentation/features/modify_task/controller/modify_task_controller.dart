import 'package:get/get.dart';
import 'package:to_do/data/sqldb.dart';

class ModifyTaskController extends GetxController {
  RxString taskTitle = ''.obs;
  RxString taskDescription = ''.obs;
  RxString taskDate = ''.obs;
  RxString taskTime = ''.obs;
  RxInt taskId = RxInt(0);

  ModifyTaskController(Map<String, dynamic> taskDetails) {
    taskId.value = taskDetails['id'];
    taskTitle.value = taskDetails['taskTitle'];
    taskDescription.value = taskDetails['taskDescription'];
    taskDate.value = taskDetails['taskDate'];
    taskTime.value = taskDetails['taskTime'];
  }
  void updateTaskDetails({
    String? title,
    String? description,
    String? date,
    String? time,
  }) {
    if (title != null) taskTitle.value = title;
    if (description != null) taskDescription.value = description;
    if (date != null) taskDate.value = date;
    if (time != null) taskTime.value = time;
  }

  void saveTask() {
    Get.back();
  }

  void updateTaskInDatabase(String newTitle, String newDescription) async {
    final database = SqlDb();

    final updateQuery = '''
    UPDATE Tasks
    SET taskTitle = '$newTitle', taskDescription = '$newDescription'
    WHERE id = ${taskId.value}; 
  ''';
    final updatedRows = await database.updateData(updateQuery);

    if (updatedRows > 0) {
      Get.back();
    } else {
      // Handle the case where the update failed
    }
  }
}
