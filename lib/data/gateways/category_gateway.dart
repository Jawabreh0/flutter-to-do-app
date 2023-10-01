import 'package:todo/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<void> createCategory(Category category);
  Future<List<Category>> getCategories();
}
