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
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: appColor,
        elevation: 0,
        title: HomeWidgets.appBarTitle(),
      ),
      backgroundColor: appColor,
      body: FutureBuilder(
        future: controller.readTotalTableRecords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a progress indicator while fetching data.
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Handle any errors that occur during data fetching.
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            // Data fetching is complete, check if there are records.
            final recordCount = snapshot.data as int;
            if (recordCount == 0) {
              return HomeWidgets.emptyHomeBody(context);
            } else {
              return HomeWidgets.homeBodyWithRecords();
            }
          }
        },
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
            color:
                controller.isButtonPressed.value ? Colors.green : Colors.white,
            size: 32,
          );
        }),
      ),
    );
  }
}
