import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/data/sqldb.dart';

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

class CategoryModel {
  final int id;
  final String catgName;
  final IconData catgIcon;
  final Color catgColor;

  CategoryModel({
    required this.id,
    required this.catgName,
    required this.catgIcon,
    required this.catgColor,
  });

  factory CategoryModel.fromMap(Map<dynamic, dynamic> map) {
    // Convert the map keys to strings
    final mapAsString =
        map.map((key, value) => MapEntry(key.toString(), value));

    final id = mapAsString['catgID'] as int?; // Use 'catgID' for the id
    final catgName = mapAsString['catgName'] as String?;
    final catgIconCodePoint = mapAsString['catgIcon'] as int?;
    final catgColorHex = mapAsString['catgColor'] as String?;

    if (id == null ||
        catgName == null ||
        catgIconCodePoint == null ||
        catgColorHex == null) {
      // Handle the case where one or more required values are missing
      // You can choose to return a default CategoryModel or throw an error
      return CategoryModel(
        id: 0,
        catgName: 'Default Name',
        catgIcon: Icons.error, // You can choose a default icon
        catgColor: Colors.red, // You can choose a default color
      );
    }

    return CategoryModel(
      id: id,
      catgName: catgName,
      catgIcon: IconData(
        catgIconCodePoint,
        fontFamily: 'MaterialIcons',
      ),
      catgColor: Color(int.parse(catgColorHex, radix: 16)),
    );
  }
}
