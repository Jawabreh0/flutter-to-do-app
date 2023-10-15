import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/domain/enitity/category_entity.dart';
import 'package:todo/domain/interactor/category_interactor.dart';

class CategoryController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  var selectedIcon = Rx<IconData?>(null);
  var selectedColor = Rx<Color?>(null);
  final CategoryInteractor _categoryInteractor;
  var categories = RxList<CategoryEntity>();

  final List<Color> preDefinedColors = [
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
  final List<IconData> preDefinedIcons = [
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

  CategoryController(this._categoryInteractor);

  Future<void> saveCategory() async {
    final category = CategoryEntity(
      id: 0,
      name: textEditingController.text,
      iconCode: selectedIcon.value!.codePoint,
      colorCode: selectedColor.value!,
    );

    await _categoryInteractor.saveCategory(category);
  }

  void updateColor(Color newColor) {
    selectedColor.value = newColor;
  }

  void updateIcon(IconData newIcon) {
    selectedIcon.value = newIcon;
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    categories.value = await _categoryInteractor.getCategories();
  }
}
