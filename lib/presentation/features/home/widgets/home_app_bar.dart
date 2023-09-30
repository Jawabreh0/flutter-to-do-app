import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/presentation/widgets/build_svg_icon.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart'; // Import the TaskController

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController taskController =
        Get.find(); // Get the controller instance

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Obx(() {
            // Use Obx to listen for changes
            return Text(
              "Task ${taskController.taskCount}", // Display the task count
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            );
          }),
          const Spacer(),
          const Text(
            LangKeys.HOME,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const BuildSvgIcon(assetKey: AssetKeys.calenderIcon),
        ],
      ),
    );
  }
}
