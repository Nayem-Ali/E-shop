import 'package:e_com_task/src/core/dependency_injection/dl.dart';
import 'package:e_com_task/src/features/explore_products/data/model/category.dart';
import 'package:e_com_task/src/features/explore_products/data/repository/products_repository_impl.dart';
import 'package:e_com_task/src/features/explore_products/domain/repository/product_repository.dart';
import 'package:e_com_task/src/features/shared/domain/use_case/base_use_case.dart';

class FetchAllCategoriesUseCase extends UseCase<List<CategoryModel>, NoParams> {
  final ProductRepository _repositoryImpl = sl.get<ProductRepositoryImpl>();

  @override
  Future<List<CategoryModel>> call(NoParams noParams) async {
    return await _repositoryImpl.fetchAllCategories();
  }
}
