import 'package:e_com_task/src/core/dependency_injection/dl.dart';
import 'package:e_com_task/src/features/explore_products/data/model/category.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/fetch_all_categories_use_case.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/fetch_all_products_use_case.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/fetch_categorized_product_use_case.dart';
import 'package:e_com_task/src/features/explore_products/domain/use_case/search_product_use_case.dart';
import 'package:e_com_task/src/features/shared/domain/use_case/base_use_case.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<Product> allProducts = RxList([]);
  RxList<CategoryModel> allCategories = RxList([]);
  RxString selectedCategory = RxString("");
  RxBool isLoading = RxBool(true);

  final FetchAllProductsUseCase _fetchAllProductsUseCase = sl.get<FetchAllProductsUseCase>();
  final FetchAllCategoriesUseCase _fetchAllCategoriesUseCase = sl.get<FetchAllCategoriesUseCase>();
  final FetchCategorizedProductUseCase _fetchCategorizedProductUseCase =
      sl.get<FetchCategorizedProductUseCase>();

  final SearchProductUseCase _searchProductUseCase = sl.get<SearchProductUseCase>();

  Future<void> fetchAllProducts({required int itemPerRequest}) async {
    isLoading.value = true;
    allProducts.value = await _fetchAllProductsUseCase.call(itemPerRequest);
    isLoading.value = false;
    update();
  }

  Future<void> fetchAllCategories() async {
    isLoading.value = true;
    allCategories.value = await _fetchAllCategoriesUseCase.call(NoParams());
    isLoading.value = false;
    update();
  }

  Future<void> fetchCategorizedProducts({required String categoryName}) async {
    isLoading.value = true;
    allProducts.value = await _fetchCategorizedProductUseCase.call(categoryName);
    isLoading.value = false;
    update();
  }

  void chooseCategory({required String category}) {
    if (selectedCategory.value == category) {
      selectedCategory.value = "";
      fetchAllProducts(itemPerRequest: 100);
    } else {
      selectedCategory.value = category;
      fetchCategorizedProducts(categoryName: category);
    }
    update();
  }

  Future<void> searchProduct({required String query}) async {
    print("Searching is Calling ${allProducts.length}");
    isLoading.value = true;
    allProducts.value = await _searchProductUseCase.call(query);
    isLoading.value = false;
    print("Searching is Calling Done ${allProducts.length}");
    update();
  }

  @override
  void onInit() async {
    await Future.wait([fetchAllProducts(itemPerRequest: 100), fetchAllCategories()]);
    super.onInit();
  }
}
