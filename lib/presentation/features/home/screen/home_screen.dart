import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart';
import 'package:todo/presentation/features/home/widgets/bottom_sheet_widget.dart';
import 'package:todo/presentation/features/home/widgets/empty_screen_widgets.dart';
import 'package:todo/presentation/features/home/widgets/home_app_bar.dart';
import 'package:todo/presentation/features/home/widgets/home_with_records_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController taskController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: const HomeAppBar(),
      ),
      backgroundColor: appColor,
      body: Obx(() {
        return taskController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : (taskController.tasks.isNotEmpty
                ? HomeWithRecords()
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
              child: BottomSheetWidgets(),
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
