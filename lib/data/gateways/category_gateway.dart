import 'package:sqflite/sqflite.dart';
import 'package:todo/core/database/database.dart';
import 'package:todo/domain/enitity/category_entity.dart';

class CategoryGateway {
  final AppDatabase _appDatabase;

  CategoryGateway(this._appDatabase);

  Future<void> saveCategory(CategoryEntity category) async {
    final Database? db = await _appDatabase.db;
    await db!.insert('Categories', category.toMap());
  }

  Future<List<CategoryEntity>> getCategories() async {
    final Database? db = await _appDatabase.db;
    final List<Map<String, dynamic>> maps = await db!.query('Categories');
    return List.generate(maps.length, (i) {
      return CategoryEntity.fromMap(maps[i]);
    });
  }
}
