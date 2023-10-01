import 'package:todo/data/gateways/category_gateway.dart';
import 'package:todo/domain/entities/category_entity.dart';

class CreateCategory {
  final CategoryRepository repository;

  CreateCategory(this.repository);

  Future<void> call(Category category) {
    return repository.createCategory(category);
  }
}
