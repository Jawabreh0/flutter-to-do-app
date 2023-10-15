import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/domain/interactor/task_interactor.dart';

class EditTaskController extends GetxController {
  final TaskInteractor _taskInteractor;
  EditTaskController(this._taskInteractor);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  RxString date = ''.obs;
  RxString time = ''.obs;

  void updateTaskData(TaskEntity taskToUpdate) async {
    if (taskToUpdate.id != null) {
      TaskEntity updatedTask = TaskEntity(
        id: taskToUpdate.id,
        title: titleController.text.isNotEmpty
            ? titleController.text
            : taskToUpdate.title,
        description: descriptionController.text.isNotEmpty
            ? descriptionController.text
            : taskToUpdate.description,
        date: date.value.isNotEmpty ? date.value : taskToUpdate.date,
        time: time.value.isNotEmpty ? time.value : taskToUpdate.time,
        isCompleted: taskToUpdate.isCompleted,
        categoryId: taskToUpdate.categoryId,
      );
      await _taskInteractor.updateTask(updatedTask);
    }
  }

  Future<void> deleteTask(int id) async {
    await _taskInteractor.deleteTask(id);
  }

  void shareTask(TaskEntity task) {
    final String content = 'Task Details:\n'
        'Title: ${task.title}\n'
        'Description: ${task.description}\n'
        'Date: ${task.date}\n'
        'Time: ${task.time}';
    Share.share(content);
  }

  void setDateAndTime(DateTime selectedDate, TimeOfDay selectedTime) {
    date.value = DateFormat('dd-MM-yy').format(selectedDate);
    time.value =
        "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}";
  }

  Future<void> pickDateTime(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      // ignore: use_build_context_synchronously
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setDateAndTime(selectedDate, selectedTime);
      }
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
