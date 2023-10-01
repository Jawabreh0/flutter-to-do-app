import 'package:flutter/material.dart';
import 'package:todo/core/database/database.dart';
import 'package:todo/data/gateways/category_gateway.dart';
import 'package:todo/domain/entities/category_entity.dart';

class MemoryCategoryRepository implements CategoryRepository {
  final AppDatabase appDatabase = AppDatabase();

  @override
  Future<void> createCategory(Category category) async {
    final db = await appDatabase.db;
    await db!.insert('Categories', {
      'catgName': category.name,
      'catgIcon': category.icon.codePoint,
      'catgColor': category.color.value.toRadixString(16),
    });
    List<Map> result = await db.query('Categories');
    print(result);
  }

  @override
  Future<List<Category>> getCategories() async {
    final db = await appDatabase.db;
    final List<Map<String, dynamic>> result = await db!.query('Categories');
    return result
        .map((e) => Category(
              name: e['catgName'],
              icon: IconData(e['catgIcon'], fontFamily: 'MaterialIcons'),
              color: Color(int.parse(e['catgColor'], radix: 16)),
            ))
        .toList();
  }
}
