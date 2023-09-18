import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:to_do/presentation/features/home/controller/home_ctrl.dart';
import 'package:intl/intl.dart';

class HomeWidgets {
  static appBarTitle() {
    return Row(
      children: [
        const Text(
          'Task 0',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        const Text(
          'Home',
          style: TextStyle(
            fontFamily: 'Lato',
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.5,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/icons/calendar.svg',
          width: 24.0,
          height: 24.0,
        ),
      ],
    );
  }

  static Widget homeImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 90, bottom: 30),
      child: Image.asset('assets/imgs/empty-home.png'),
    );
  }

  static Widget homeMainText() {
    return const Text(
      'What do you want to do today?',
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.5,
        color: Colors.white,
      ),
    );
  }

  static Widget homeSecText() {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        'Tap + to add your tasks',
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.5,
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget createNewTask(BuildContext context) {
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

  static Widget bottomSheetTitle() {
    return const Padding(
      padding: EdgeInsets.only(
        left: 25.0,
        top: 25.0,
      ),
      child: Text(
        'Add Task',
        style: TextStyle(
          fontFamily: 'Lato',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  static Widget taskTitleField() {
    final HomeController controller = Get.find<HomeController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 26.0, 0.0),
      child: TextField(
        onChanged: (value) {
          controller.taskTitle.value = value;
        },
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Task Title',
          hintStyle: TextStyle(
            color: hintFontColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fieldBordersColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fieldBordersColor,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        ),
        autofocus: true,
      ),
    );
  }

  static Widget taskDescriptionField() {
    final HomeController controller = Get.find<HomeController>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 26.0, 0.0),
      child: TextField(
        onChanged: (value) {
          controller.taskDescription.value = value;
        },
        style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Description',
          hintStyle: TextStyle(
            color: hintFontColor,
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
        ),
      ),
    );
  }

  static Widget timerIconButton(context) {
    final HomeController controller = Get.find<HomeController>();

    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/timer-icon.svg',
        width: 24.0,
        height: 24.0,
      ),
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
            // Format the selected date and time separately.
            String formattedDate =
                DateFormat('yyyy-MM-dd').format(selectedDate);
            String formattedTime = selectedTime.format(context);

            // Send the formatted date and time to the controller.
            controller.taskDate.value = formattedDate;
            controller.taskTime.value = formattedTime;
          }
        }
      },
      color: Colors.white,
    );
  }

  static Widget tagIconButton() {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/tag-icon.svg',
        width: 24.0,
        height: 24.0,
      ),
      onPressed: () {
        //TODO
      },
      color: Colors.white,
    );
  }

  static Widget sendIconButton() {
    final HomeController controller = Get.find<HomeController>();

    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/send-icon.svg',
        width: 24.0,
        height: 24.0,
      ),
      onPressed: () {
        controller.printDate();
        /*controller.insertNewTask();
                controller.readAllTasks(); // Print task details
                Navigator.of(context).pop();*/ // Close the bottom sheet
      },
      color: Colors.white,
    );
  }
}
