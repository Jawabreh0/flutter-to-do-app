import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/widgets/build_svg_icon.dart';
import 'package:todo/domain/entities/task_entity.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart';

class HomeWithRecords extends StatelessWidget {
  HomeWithRecords({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeController taskController = Get.find();
    searchController.addListener(() {
      taskController.searchTask(searchController.text);
    });
    return SingleChildScrollView(
      child: Column(
        children: [
          homeSeachBar(),
          const SizedBox(height: 20),
          taskFilterButton(taskController),
          const SizedBox(height: 16),
          taskCards(),
        ],
      ),
    );
  }

  Widget homeSeachBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          labelText: LangKeys.SEARCH_FOR_YOUR_TASK,
          labelStyle: TextStyle(color: hintFontColor),
          prefixIcon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: BuildSvgIcon(assetKey: AssetKeys.searchIcon)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.8,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: hintFontColor,
              width: 0.8,
            ),
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget taskFilterButton(HomeController taskController) {
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
            child: Obx(() {
              // Wrapping with Obx
              return DropdownButton<String>(
                value: taskController
                    .currentFilter.value, // Obx will update this value
                items:
                    <String>['All', 'Completed', 'Today'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    taskController.currentFilter.value = newValue;
                    taskController.applyFilter();
                  }
                },
                underline: Container(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                dropdownColor: bottomSheetColor,
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget taskCards() {
    final HomeController taskController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() {
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: taskController.filteredTasks.length,
          itemBuilder: (context, index) {
            Task task = taskController.filteredTasks[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Card(
                color: bottomSheetColor,
                child: ListTile(
                  title: Text(
                    task.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "${task.date} At ${task.time}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  leading: Checkbox(
                    value: task.completed,
                    onChanged: (value) {
                      taskController.updateTaskCompletion(task.id, value!);
                    },
                    side: MaterialStateBorderSide.resolveWith(
                      (states) =>
                          const BorderSide(width: 1.0, color: Colors.white),
                    ),
                    shape: const CircleBorder(),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
