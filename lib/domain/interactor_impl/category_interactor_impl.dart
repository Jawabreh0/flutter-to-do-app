import 'package:todo/data/gateways/category_gateway.dart';
import 'package:todo/domain/enitity/category_entity.dart';
import 'package:todo/domain/interactor/category_interactor.dart';

class CategoryInteractorImpl implements CategoryInteractor {
  final CategoryGateway _categoryGateway;

  CategoryInteractorImpl(this._categoryGateway);

  @override
  Future<void> saveCategory(CategoryEntity category) async {
    await _categoryGateway.saveCategory(category);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await _categoryGateway.getCategories();
  }
}
