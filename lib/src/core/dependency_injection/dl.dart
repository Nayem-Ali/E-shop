import 'package:dio/dio.dart';
import 'package:e_com_task/src/core/network/dio_client.dart';
import 'package:e_com_task/src/features/explore_products/data/repository/products_repository_impl.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/fetch_all_categories_use_case.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/fetch_all_products_use_case.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/fetch_categorized_product_use_case.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/search_product_use_case.dart';
import 'package:e_com_task/src/features/explore_products/presentation/controller/product_controller.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> setupServices() async {
  sl.registerSingleton<DioClient>(DioClient(Dio()));
  sl.registerSingleton<ProductRepositoryImpl>(ProductRepositoryImpl());
  sl.registerSingleton<FetchAllProductsUseCase>(FetchAllProductsUseCase());
  sl.registerSingleton<FetchAllCategoriesUseCase>(FetchAllCategoriesUseCase());
  sl.registerSingleton<FetchCategorizedProductUseCase>(FetchCategorizedProductUseCase());
  sl.registerSingleton<SearchProductUseCase>(SearchProductUseCase());
  sl.registerSingleton<ProductController>(ProductController());
}
