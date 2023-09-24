import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
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
    taskTitle.value = title!;
    taskDescription.value = description!;
    taskDate.value = date!;
    taskTime.value = time!;
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

  void updateTaskDateTime(String newTime, String newDate) async {
    final database = SqlDb();

    final updateQuery = '''
    UPDATE Tasks
    SET taskDate = '$newDate', taskTime = '$newTime'
    WHERE id = ${taskId.value}; 
  ''';
    final updatedRows = await database.updateData(updateQuery);

    if (updatedRows > 0) {
      Get.back();
    } else {
      // Handle the case where the update failed
    }
  }

  void deleteTask(int taskId) async {
    final database = SqlDb();

    final deleteQuery = '''
    DELETE FROM Tasks
    WHERE id = $taskId;
  ''';

    final deletedRows = await database.deleteData(deleteQuery);

    if (deletedRows > 0) {
      // Task deleted successfully
      // You can also update your UI to reflect the deletion
    } else {
      // Handle the case where the deletion failed
    }
  }

  void shareData() {
    final text = 'Title: ${taskTitle.value}\n'
        'Description: ${taskDescription.value}\n'
        'Date: ${taskDate.value}\n'
        'Time: ${taskTime.value}';
    final subject = 'Task Details';

    Share.share(text, subject: subject);
  }
}
