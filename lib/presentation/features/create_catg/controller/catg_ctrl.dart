import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatgController extends GetxController {
  Rx<Color> selectedColor = Colors.red.obs;

  void changeColor(Color color) {
    selectedColor.value = color;
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
}
