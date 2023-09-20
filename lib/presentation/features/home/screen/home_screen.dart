// empty_home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/core/app-colors/palette.dart';
import 'package:to_do/presentation/features/home/controller/home_ctrl.dart';
import '../widget/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: appColor,
          titleSpacing: 24.0,
          elevation: 0,
          title: HomeWidgets.appBarTitle(),
        ),
        backgroundColor: appColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  if (controller.recordCount.value == 0) {
                    return HomeWidgets.emptyHomeBody();
                  } else {
                    return HomeWidgets.homeBodyWithRecords();
                  }
                }),
              ],
            ),
          ),
        ),
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
                child: HomeWidgets.createNewTask(context),
              ),
              backgroundColor: bottomSheetColor,
            );
          },
          child: Obx(() {
            return Icon(
              Icons.add,
              color: controller.isButtonPressed.value
                  ? Colors.green
                  : Colors.white,
              size: 32,
            );
          }),
        ));
  }
}
