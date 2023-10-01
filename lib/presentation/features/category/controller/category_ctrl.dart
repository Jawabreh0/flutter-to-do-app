import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/domain/entities/category_entity.dart';
import 'package:todo/domain/interactors/category_interactor.dart';

class CategoryController extends GetxController {
  final CreateCategory createCategory;
  var selectedIcon = Rx<IconData?>(null);
  var selectedColor = Rx<Color?>(null);
  var name = Rx<String?>("");

  final TextEditingController textEditingController = TextEditingController();

  CategoryController(this.createCategory);
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

  void create() {
    // Step 2: Read the text from TextEditingController
    name.value = textEditingController.text;

    // Proceed only if all fields are non-null
    if (selectedIcon.value != null &&
        selectedColor.value != null &&
        name.value != null &&
        name.value!.isNotEmpty) {
      final category = Category(
        name: name.value!,
        icon: selectedIcon.value!,
        color: selectedColor.value!,
      );
      createCategory(category);
    } else {
      // Handle the error state. Perhaps show a notification
    }
  }

  var categories = RxList<Category>();

  Future<void> fetchCategories() async {
    final fetchedCategories = await createCategory.repository.getCategories();
    categories.assignAll(fetchedCategories);
  }

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
}
