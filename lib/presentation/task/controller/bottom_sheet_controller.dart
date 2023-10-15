import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/error_dialog.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/domain/interactor/task_interactor.dart';
import 'package:intl/intl.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';

class BottomSheetController extends GetxController {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int? selectedCategoryId;

  final TaskInteractor _taskInteractor = Get.find<TaskInteractor>();

  void setSelectedDateTime(DateTime date, TimeOfDay time) {
    selectedDate = date;
    selectedTime = time;
  }

  void setSelectedCategoryId(int? id) {
    selectedCategoryId = id;
  }

  Future<void> saveTask() async {
    try {
      if (taskTitleController.text.isEmpty ||
          taskDescriptionController.text.isEmpty) {
        Get.snackbar(LangKeys.ERROR, LangKeys.CANT_KEEP_TASK_FIELD_EMPTY);
        return;
      } else if (selectedDate == null || selectedTime == null) {
        Get.snackbar(LangKeys.ERROR, LangKeys.DATE_OR_TIME_CANT_BE_EMPTY);
        return;
      } else if (selectedCategoryId == null) {
        Get.snackbar(LangKeys.ERROR, LangKeys.CATEGORY_CANT_BE_EMPTY);
        return;
      }

      String formattedDate = DateFormat('dd-MM-yy').format(selectedDate!);
      String formattedTime = '${selectedTime!.hour}:${selectedTime!.minute}';

      final task = TaskEntity(
        id: 0,
        title: taskTitleController.text,
        description: taskDescriptionController.text,
        date: formattedDate,
        time: formattedTime,
        isCompleted: false,
        categoryId: selectedCategoryId,
      );

      await _taskInteractor.saveTask(task);
      Get.find<HomeController>().fetchTasks();
      Get.back();
    } catch (e) {
      ErrorDialog(errorMessage: e.toString());
    }
  }

  Future<void> selectDateTime(BuildContext context) async {
    try {
      DateTime? tempSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(3000),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark(),
            child: child!,
          );
        },
      );

      if (tempSelectedDate != null) {
        // ignore: use_build_context_synchronously
        TimeOfDay? tempSelectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return Theme(
              data: ThemeData.dark(),
              child: child!,
            );
          },
        );

        if (tempSelectedTime != null) {
          setSelectedDateTime(tempSelectedDate, tempSelectedTime);
        }
      }
    } catch (e) {
      ErrorDialog(errorMessage: e.toString());
    }
  }
}
