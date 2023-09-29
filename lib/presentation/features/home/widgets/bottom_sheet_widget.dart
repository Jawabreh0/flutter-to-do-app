import 'package:flutter/material.dart';
import 'package:todo/core/constants/assset_keys.dart';
import 'package:todo/core/constants/lang_keys.dart';
import 'package:todo/core/constants/palette.dart';
import 'package:todo/core/presentation/widgets/build_svg_icon.dart';
import 'package:get/get.dart';
import 'package:todo/presentation/features/home/controller/home_ctrl.dart';

class BottomSheetWidgets extends StatelessWidget {
  BottomSheetWidgets({super.key});

  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        bottomSheetTitle(),
        const SizedBox(
          height: 16.0,
        ),
        taskTitleField(),
        const SizedBox(
          height: 12.0,
        ),
        taskDescriptionField(),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                timerIconButton(context),
                const SizedBox(
                  width: 16.0,
                ),
                tagIconButton(),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            sendIconButton(),
          ],
        ),
      ],
    );
  }

  Widget bottomSheetTitle() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 25.0,
        top: 25.0,
      ),
      child: Text(
        LangKeys.ADD_TASK,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget taskTitleField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 26.0, 0.0),
      child: TextField(
        controller: taskController.taskTitleController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: LangKeys.TASK_TITLE,
          hintStyle: TextStyle(
            color: hintFontColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fieldBordersColor,
            ),
          ),
          enabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        ),
        autofocus: true,
      ),
    );
  }

  Widget taskDescriptionField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 26.0, 0.0),
      child: TextField(
        controller: taskController.taskDescriptionController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: LangKeys.DESCRIPTION,
          hintStyle: TextStyle(
            color: hintFontColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fieldBordersColor,
            ),
          ),
          enabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        ),
        autofocus: true,
      ),
    );
  }

  Widget timerIconButton(context) {
    return IconButton(
      icon: const BuildSvgIcon(assetKey: AssetKeys.timerIcon),
      onPressed: () async {
        DateTime? selectedDate = await showDatePicker(
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
        if (selectedDate != null) {
          taskController.selectedDate.value = selectedDate;
          TimeOfDay? selectedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.dark(),
                child: child!,
              );
            },
          );

          if (selectedTime != null) {
            taskController.selectedTime.value = selectedTime;
          }
        }
      },
      color: Colors.white,
    );
  }

  Widget tagIconButton() {
    return IconButton(
      icon: const BuildSvgIcon(assetKey: AssetKeys.tagIcon),
      onPressed: () {
        //TODO: Make something with the tag icon
      },
      color: Colors.white,
    );
  }

  Widget sendIconButton() {
    return IconButton(
      icon: const BuildSvgIcon(assetKey: AssetKeys.sendIcon),
      onPressed: () {
        taskController.addTask();
      },
      color: Colors.white,
    );
  }
}
