import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:to_do/presentation/features/home/controller/home_ctrl.dart';
import 'package:intl/intl.dart';

class HomeWidgets {
  static FutureBuilder<int> appBarTitle() {
    final HomeController controller = Get.find<HomeController>();
    return FutureBuilder<int>(
      future: controller.readTotalTableRecords(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text("Task Null");
        } else {
          return Row(
            children: [
              Text(
                'Task ${snapshot.data}',
                style: const TextStyle(
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
      },
    );
  }

  static Widget emptyHomeBody() {
    return Column(
      children: [
        homeImage(),
        homeMainText(),
        homeSecText(),
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
                tagIconButton(context),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            sendIconButton(context),
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

  static Widget tagIconButton(context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/tag-icon.svg',
        width: 24.0,
        height: 24.0,
      ),
      onPressed: () {
        showCategoryDialog(context);
      },
      color: Colors.white,
    );
  }

  static Widget sendIconButton(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/send-icon.svg',
        width: 24.0,
        height: 24.0,
      ),
      onPressed: () {
        controller.insertNewTask(context);
        controller.readAllTasks(); // Print task details
        Navigator.of(context).pop(); // Close the bottom sheet
      },
      color: Colors.white,
    );
  }

  static void showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bottomSheetColor,
          title: Column(
            children: [
              const Center(
                child: Text(
                  'Choose Category',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Divider(
                color: fieldBordersColor,
                thickness: 1,
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: bottomSheetColor,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: appSecondaryColor),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // TODO
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appSecondaryColor,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Choose',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget homeBodyWithRecords() {
    final HomeController controller = Get.find<HomeController>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 25, 24, 0),
          child: TextField(
            onChanged: controller.updateSearchQuery,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(20.0),
              labelText: 'Search for your task...',
              labelStyle: TextStyle(color: hintFontColor),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  width: 24,
                  height: 24,
                ),
              ),
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
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0), // Add padding here
            child: Container(
              decoration: BoxDecoration(
                color: bottomSheetColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0), // Adjust horizontal padding here
                child: DropdownButton<String>(
                  value: controller.selectedFilter.value,
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
                      controller.selectedFilter.value = newValue;
                      controller.filterTasks();
                    }
                  },
                  underline: Container(),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  // Set the background color of the dropdown list to red
                  dropdownColor: bottomSheetColor,
                ),
              ),
            ),
          ),
        ),
        Obx(() {
          final filteredTasks = controller.filteredTasks;
          if (filteredTasks.isEmpty) {
            return const Center(child: Text('No tasks found.'));
          } else {
            return ListView.builder(
              itemCount: filteredTasks.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                bool isCompleted = filteredTasks[i]['taskCompletion'] == 1;
                return Container(
                  margin: const EdgeInsets.only(top: 14, left: 24, right: 24),
                  child: Card(
                    color: bottomSheetColor,
                    child: ListTile(
                      leading: GestureDetector(
                        onTap: () {
                          bool newCompletionStatus = !isCompleted;
                          controller.updateTaskCompletion(
                            filteredTasks[i]['id'],
                            newCompletionStatus,
                          );
                        },
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCompleted ? Colors.blue : Colors.white,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: isCompleted
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      title: Text(
                        "${filteredTasks[i]['taskTitle']}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      subtitle: Text(
                        controller.isToday(filteredTasks[i]['taskDate'])
                            ? "Today At ${filteredTasks[i]['taskTime']}"
                            : "${filteredTasks[i]['taskDate']} At ${filteredTasks[i]['taskTime']}",
                        style: TextStyle(
                          color: hintFontColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }),
      ],
    );
  }

  /* static Widget homeSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 25, 24, 0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          labelText: 'Search for your task...',
          labelStyle: TextStyle(color: hintFontColor),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 24,
              height: 24,
            ),
          ),
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
      ),
    );
  }*/
}
