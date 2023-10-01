import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var selectedIcon = Rx<IconData?>(null);
  var selectedColor = Rx<Color?>(null);

  final List<IconData> iconsList = [
    Icons.star,
    Icons.favorite,
    Icons.access_alarm,
    Icons.account_balance,
    Icons.ac_unit,
    Icons.add,
    Icons.adjust,
    Icons.airline_seat_flat,
    Icons.airport_shuttle,
    Icons.announcement,
  ];

  void updateIcon(IconData newIcon) {
    selectedIcon.value = newIcon;
  }

  final List<Color> colorsList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.brown,
    Colors.grey,
    Colors.teal,
  ];

  void updateColor(Color newColor) {
    selectedColor.value = newColor;
  }
}
