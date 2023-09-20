import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/data/sqldb.dart';

class CatgController extends GetxController {
  SqlDb sqlDb = SqlDb();

  Rx<Color> selectedColor = Colors.red.obs;
  Rx<IconData?> selectedIcon = Rx<IconData?>(null);
  RxString catgName = "".obs;

  int? materialIconCodePoint;
  String? materialIconFontFamily;
  String? materialIconFontPackage;
  bool? materialIconDirection;

  void printFun() {
    print(
        "Selected Color:$selectedColor and the Catg Name : $catgName  Icon:$selectedIcon");
  }

  void insertNewCatg() async {
    if (selectedIcon.value is IconData) {
      final icon = selectedIcon.value as IconData;
      materialIconCodePoint = icon.codePoint;
      materialIconFontFamily = icon.fontFamily;
      materialIconFontPackage = icon.fontPackage;
      materialIconDirection = icon.matchTextDirection;
    }

    String iconCodePoint = selectedIcon.value!.codePoint.toString();
    String colorValue = selectedColor.value.value.toRadixString(16);
    int response = await sqlDb.insertData('''
    INSERT INTO Categories (catgName, catgIcon, catgColor, materialIconCodePoint, materialIconFontFamily, materialIconFontPackage, materialIconDirection)
    VALUES ('$catgName', '$iconCodePoint', '$colorValue', '$materialIconCodePoint', '$materialIconFontFamily', '$materialIconFontPackage', '$materialIconDirection')
  ''');
    if (response > 0) {
      print("Done");
    } else {
      print("ERROR");
    }
  }
//

  Future<List<CategoryModel>> fetchCategories() async {
    final List<Map<String, dynamic>> categoriesData =
        await sqlDb.readData("SELECT * FROM 'Categories'");
    return categoriesData.map((data) {
      final catgIconCodePoint = int.parse(data['catgIcon']);
      final catgColor = Color(int.parse('0x${data['catgColor']}'));

      IconData catgIcon;

      if (data['materialIconCodePoint'] != null) {
        catgIcon = IconData(
          catgIconCodePoint,
          fontFamily: data['materialIconFontFamily'],
          fontPackage: data['materialIconFontPackage'],
          matchTextDirection: data['materialIconDirection'] == 1,
        );
      } else {
        catgIcon = Icons.error;
      }

      return CategoryModel(
        catgName: data['catgName'],
        catgIcon: catgIcon,
        catgColor: catgColor,
      );
    }).toList();
  }

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
  final String catgName;
  final IconData catgIcon;
  final Color catgColor;

  CategoryModel({
    required this.catgName,
    required this.catgIcon,
    required this.catgColor,
  });
}
