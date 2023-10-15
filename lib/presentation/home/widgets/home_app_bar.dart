import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';
import 'package:todo/presentation/calender/widgets/calender_widgets.dart';
import 'package:todo/presentation/home/controller/home_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController taskListController = Get.find();

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Obx(() => Text(
                "Task ${taskListController.taskCount.value}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )),
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
          IconButton(
            icon: const BuildSvgIcon(assetKey: AssetKeys.calenderIcon),
            onPressed: () {
              Get.to(CalendarWidgets());
            },
          ),
        ],
      ),
    );
  }
}
