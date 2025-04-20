import 'package:e_com_task/src/core/dependency_injection/dl.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';
import 'package:e_com_task/src/features/explore_products/data/repository/products_repository_impl.dart';
import 'package:e_com_task/src/features/explore_products/domain/repository/product_repository.dart';
import 'package:e_com_task/src/features/shared/domain/use_case/base_use_case.dart';

class SearchProductUseCase extends UseCase<List<Product>, String> {
  final ProductRepository _repositoryImpl = sl.get<ProductRepositoryImpl>();

  @override
  Future<List<Product>> call(String query) async {
    return await _repositoryImpl.searchProducts(query: query);
  }


}
