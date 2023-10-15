import 'package:todo/domain/enitity/category_entity.dart';

abstract class CategoryInteractor {
  Future<void> saveCategory(CategoryEntity category);
  Future<List<CategoryEntity>> getCategories();
}
