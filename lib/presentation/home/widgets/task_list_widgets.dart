import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/presentation/category/controller/category_controller.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';
import 'package:todo/presentation/home/widgets/search_bar.dart';
import 'package:todo/presentation/home/widgets/task_cards.dart';
import 'package:todo/presentation/home/widgets/task_filter_button.dart';

class TaskListWidget extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController taskController = Get.find();
    final CategoryController categoryController = Get.find();

    searchController.addListener(() {
      taskController.searchTask(searchController.text);
    });

    return SingleChildScrollView(
      child: Column(
        children: [
          HomeSearchBar(searchController: searchController),
          const SizedBox(height: 20),
          TaskFilterButton(taskController: taskController),
          const SizedBox(height: 16),
          TaskCards(
            taskController: taskController,
            categoryController: categoryController,
          ),
        ],
      ),
    );
  }
}
