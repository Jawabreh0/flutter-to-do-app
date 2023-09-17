import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isButtonPressed = false.obs;
  RxString taskTitle = "".obs;
  RxString taskDescription = "".obs;

  void printTaskDetails() {
    print("Task Title: ${taskTitle.value}");
    print("Task Description: ${taskDescription.value}");
  }
}
