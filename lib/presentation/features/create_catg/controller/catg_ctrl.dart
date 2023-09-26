import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/data/sqldb.dart';
import 'package:to_do/presentation/features/create_catg/create_catg_model.dart/create_catg_model.dart';

class CatgController extends GetxController {
  SqlDb sqlDb = SqlDb();
  Rx<Color> selectedColor = Colors.red.obs;
  Rx<IconData?> selectedIcon = Rx<IconData?>(null);
  RxString catgName = "".obs;
  int? materialIconCodePoint;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  void fetchCategories() async {
    final List<Map> categoryList =
        await sqlDb.readData('SELECT * FROM Categories');
    categories.value =
        categoryList.map((map) => CategoryModel.fromMap(map)).toList();
  }

  void printFun() {
    print(
        "Selected Color:$selectedColor and the Catg Name : $catgName  Icon:$selectedIcon");
  }

  void insertNewCatg() async {
    if (selectedIcon.value is IconData) {
      final icon = selectedIcon.value as IconData;
      materialIconCodePoint = icon.codePoint;

      String iconCodePoint =
          materialIconCodePoint.toString(); // Use materialIconCodePoint
      String colorValue = selectedColor.value.value.toRadixString(16);
      int response = await sqlDb.insertData('''
        INSERT INTO Categories (catgName, catgIcon, catgColor)
        VALUES ('$catgName', '$iconCodePoint', '$colorValue')
      ''');
      if (response > 0) {
        print("Done");
      } else {
        print("ERROR");
      }
    }
  }
//

  Future<List<Map>> readAllCatgs() async {
    List<Map<dynamic, dynamic>> response =
        await sqlDb.readData("SELECT * FROM 'Categories'");
    return response;
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
