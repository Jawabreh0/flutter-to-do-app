import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatgController extends GetxController {
  Rx<Color> selectedColor = Colors.red.obs;
  Rx<IconData?> selectedIcon = Rx<IconData?>(null);
  RxString catgName = "".obs;

  void changeColor(Color color) {
    selectedColor.value = color;
  }

  void printFun() {
    print(
        "Selected Color:${selectedColor.value} and the Catg Name : ${catgName.value}");
  }

  void handleSelectedButton(IconData selectedIcon) {
    this.selectedIcon.value = selectedIcon;
    print("Selected Icon: $selectedIcon");
  }

  final List<Color> colorsList = [
    Colors.yellow,
    Colors.green,
    Colors.blueAccent,
    Colors.blue,
    Colors.lightBlue,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.red,
    Colors.grey,
    Colors.cyan,
  ];

  final List<IconData> iconList = [
    Icons.food_bank,
    Icons.work,
    Icons.sports,
    Icons.design_services,
    Icons.school,
    Icons.social_distance,
    Icons.music_note,
    Icons.health_and_safety,
    Icons.movie,
    Icons.home,
    Icons.logo_dev,
    Icons.self_improvement,
    Icons.hiking,
    Icons.surfing,
    Icons.kitesurfing,
    Icons.bathroom,
    Icons.engineering,
    Icons.construction
  ];
}
