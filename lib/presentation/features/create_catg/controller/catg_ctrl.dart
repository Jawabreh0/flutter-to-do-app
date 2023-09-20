import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatgController extends GetxController {
  Rx<Color> selectedColor = Colors.red.obs;
  Rx<IconData?> selectedIcon = Rx<IconData?>(null);
  RxString catgName = "".obs;

  void printFun() {
    print(
        "Selected Color:$selectedColor and the Catg Name : $catgName  Icon:$selectedIcon");
  }

  final List<Color> colorsList = [
    Colors.yellow,
    Colors.green,
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
