import 'package:e_com_task/src/features/explore_products/data/model/category.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';

abstract class ProductRepository{
  Future<List<Product>> fetchAllProducts({required int itemPerRequest});
  Future<List<CategoryModel>> fetchAllCategories();
  Future<List<Product>> fetchProductsByCategory({required String categoryName});
  Future<List<Product>> searchProducts({required String query});
}