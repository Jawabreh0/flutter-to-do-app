import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/build_svg_icon.dart';
import 'package:todo/domain/enitity/task_entity.dart';
import 'package:todo/presentation/calender/widgets/calender_widgets.dart';
import 'package:todo/presentation/task/controller/edit_task_controller.dart';

class EditTaskScreenButtons extends StatelessWidget {
  final EditTaskController controller;
  final TaskEntity task;

  const EditTaskScreenButtons(
      {super.key, required this.controller, required this.task});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Divider(
              color: fieldBordersColor,
              thickness: 1,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ElevatedButton.icon(
              onPressed: () => controller.shareTask(task),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: const BuildSvgIcon(assetKey: AssetKeys.shareIcon),
              label: const Text(LangKeys.SHARE_TASK),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ElevatedButton.icon(
              onPressed: () {
                Get.to(() => CalendarWidgets());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: const BuildSvgIcon(assetKey: AssetKeys.calenderIcon),
              label: const Text(LangKeys.CALENDER),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ElevatedButton.icon(
              onPressed: () {
                //TODO: CALL DELETE FUNCTION
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              icon: const BuildSvgIcon(assetKey: AssetKeys.trashIcon),
              label: Text(
                LangKeys.DELETE_TASK,
                style: TextStyle(color: deleteTaskRedColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
