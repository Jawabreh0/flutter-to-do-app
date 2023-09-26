import 'package:flutter/material.dart';

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
