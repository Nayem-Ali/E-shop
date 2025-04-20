import 'package:e_com_task/src/features/explore_products/data/data_soruce/remote/product_remote_data_source.dart';
import 'package:e_com_task/src/features/explore_products/data/model/category.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';
import 'package:e_com_task/src/features/explore_products/domain/repository/product_repository.dart';
import 'package:flutter/foundation.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource _dataSource = ProductRemoteDataSource();

  @override
  Future<List<Product>> fetchAllProducts({required int itemPerRequest}) async {
    List<Product> allProducts = await _dataSource.fetchAllProducts(itemPerRequest: itemPerRequest);
    return allProducts;
  }

  @override
  Future<List<CategoryModel>> fetchAllCategories() async {
    List<CategoryModel> allCategories = await _dataSource.fetchAllCategories();
    return allCategories;
  }

  @override
  Future<List<Product>> fetchProductsByCategory({required String categoryName}) async {
    List<Product> allProducts = await _dataSource.fetchAllProductsByCategory(categoryName: categoryName);
    return allProducts;
  }

  @override
  Future<List<Product>> searchProducts({required String query}) async {
    List<Product> allProducts = await _dataSource.searchProduct(query: query);
    return allProducts;
  }
}
