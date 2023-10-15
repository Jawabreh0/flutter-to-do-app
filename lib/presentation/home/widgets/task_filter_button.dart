import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';

class TaskFilterButton extends StatelessWidget {
  final HomeController taskController;

  const TaskFilterButton({super.key, required this.taskController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Container(
          decoration: BoxDecoration(
            color: bottomSheetColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Obx(
              () {
                return DropdownButton<TaskFilter>(
                  value: taskController.currentFilter.value,
                  items: TaskFilter.values.map((TaskFilter filter) {
                    return DropdownMenuItem<TaskFilter>(
                      value: filter,
                      child: Text(
                        filter.name,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (TaskFilter? newFilter) {
                    if (newFilter != null) {
                      taskController.applyFilter(newFilter);
                    }
                  },
                  underline: Container(),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  dropdownColor: Colors.grey,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
