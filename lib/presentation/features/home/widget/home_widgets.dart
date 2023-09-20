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
                    fontFamily: 'Lato',
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
        homeSearchBar(),
        const SizedBox(height: 20),
        FutureBuilder(
          future: controller.readAllTasks(),
          builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(top: 14, left: 24, right: 24),
                    child: Card(
                      color: bottomSheetColor,
                      child: ListTile(
                        //leading: left icon,
                        title: Text(
                          "${snapshot.data![i]['taskTitle']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Text(
                          controller.isToday(snapshot.data![i]['taskDate'])
                              ? "Today At ${snapshot.data![i]['taskTime']}"
                              : "${snapshot.data![i]['taskDate']} At ${snapshot.data![i]['taskTime']}",
                          style: TextStyle(
                            color: hintFontColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // trailing: right icon,
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }

  static Widget homeSearchBar() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 25, 24, 0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(20.0),
            labelText: 'Search for your task...',
            labelStyle: TextStyle(color: hintFontColor),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0.8,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0.8,
              ),
            ),
          ),
        ));
  }
}
