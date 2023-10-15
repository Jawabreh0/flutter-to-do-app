import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/task/controller/bottom_sheet_controller.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';
import 'package:todo/presentation/task/widget/bottom_sheet_widgets.dart';
import 'package:todo/presentation/home/widgets/empty_home.dart';
import 'package:todo/presentation/home/widgets/home_app_bar.dart';
import 'package:todo/presentation/home/widgets/task_list_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomSheetController bottomSheetController = Get.find();
    final HomeController taskListController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const HomeAppBar(),
      ),
      backgroundColor: appColor,
      body: Obx(() {
        return taskListController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : (taskListController.taskCount.value > 0
                ? TaskListWidget()
                : const EmptyHomeScreenWidgets());
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appSecondaryColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: BottomSheetWidgets(controller: bottomSheetController),
            ),
            backgroundColor: bottomSheetColor,
          );
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
    );
  }
}
