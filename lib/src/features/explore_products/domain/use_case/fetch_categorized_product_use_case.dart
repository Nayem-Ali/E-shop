import 'package:e_com_task/src/core/dependency_injection/dl.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';
import 'package:e_com_task/src/features/explore_products/data/repository/products_repository_impl.dart';
import 'package:e_com_task/src/features/explore_products/domain/repository/product_repository.dart';
import 'package:e_com_task/src/features/shared/domain/use_case/base_use_case.dart';

class FetchCategorizedProductUseCase extends UseCase<List<Product>, String> {
  final ProductRepository _repositoryImpl = sl.get<ProductRepositoryImpl>();

  @override
  Future<List<Product>> call(String categoryName) async {
    List<Product> categorizedProducts = await _repositoryImpl.fetchProductsByCategory(
      categoryName: categoryName,
    );
    return categorizedProducts;
  }
}
