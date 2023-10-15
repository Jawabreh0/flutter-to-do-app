import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';

class TaskCards extends StatelessWidget {
  final HomeController taskController;
  final CategoryController categoryController;

  const TaskCards(
      {super.key,
      required this.taskController,
      required this.categoryController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(
        () {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: taskController.filteredTasks.length,
            itemBuilder: (context, index) {
              TaskEntity task = taskController.filteredTasks[index];
              final category = taskController.getCategoryForTask(task);

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () => taskController.onTaskTap(task),
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
                        value: task.isCompleted,
                        onChanged: (value) {
                          taskController.updateTaskCompletion(task.id!, value!);
                        },
                        side: MaterialStateBorderSide.resolveWith(
                          (states) =>
                              const BorderSide(width: 1.0, color: Colors.white),
                        ),
                        shape: const CircleBorder(),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: category.colorCode,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              IconData(category.iconCode,
                                  fontFamily: 'MaterialIcons'),
                              color: Colors.white,
                            ),
                            Text(
                              category.name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
