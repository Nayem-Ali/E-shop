import 'package:e_com_task/src/core/dependency_injection/dl.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';
import 'package:e_com_task/src/features/explore_products/data/repository/products_repository_impl.dart';
import 'package:e_com_task/src/features/explore_products/domain/repository/product_repository.dart';
import 'package:e_com_task/src/features/shared/domain/use_case/base_use_case.dart';

class FetchAllProductsUseCase extends UseCase<List<Product>, int> {
  final ProductRepository _repositoryImpl = sl.get<ProductRepositoryImpl>();

  @override
  Future<List<Product>> call(int itemPerRequest) async {
    return await _repositoryImpl.fetchAllProducts(itemPerRequest: itemPerRequest);
  }
}
