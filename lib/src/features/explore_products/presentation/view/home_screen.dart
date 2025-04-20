import 'package:e_com_task/src/core/router/routes_name.dart';
import 'package:e_com_task/src/features/explore_products/data/model/category.dart';
import 'package:e_com_task/src/features/explore_products/data/model/product.dart';
import 'package:e_com_task/src/features/explore_products/presentation/component/product_card.dart';
import 'package:e_com_task/src/features/explore_products/presentation/component/product_grid_shimmer.dart';
import 'package:e_com_task/src/features/explore_products/presentation/component/product_search_bar.dart';
import 'package:e_com_task/src/features/explore_products/presentation/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductController _productController = Get.find<ProductController>();
  final TextEditingController _searchController = TextEditingController();
  RxBool _isSearching = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Shop"),
        actions: [
          Obx(
            () => ProductSearchBar(
              isSearching: _isSearching.value,
              controller: _searchController,
              onPressed: () {
                _productController.searchProduct(query: _searchController.text.trim());
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              _isSearching.value = !_isSearching.value;
              _productController.chooseCategory(
                category: _productController.selectedCategory.value,
              );
              if (_isSearching.value == false) {
                _searchController.clear();
                _productController.fetchAllProducts(itemPerRequest: 100);
              }
              ;
            },
          ),
        ],
      ),
      body: GetBuilder(
        init: _productController,
        builder: (controller) {
          List<Product> allProducts = _productController.allProducts;
          List<CategoryModel> allCategories = _productController.allCategories;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: allCategories.length,
                  itemBuilder: (context, index) {
                    final CategoryModel category = allCategories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ChoiceChip(
                        label: Text(category.name),
                        selected: _productController.selectedCategory.value == category.name,
                        onSelected: (value) {
                          _productController.chooseCategory(category: category.name);
                        },
                        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
              if (_productController.isLoading.value)
                Expanded(child: ProductGridShimmer())
              else if (allProducts.isNotEmpty)
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: allProducts.length,
                    itemBuilder: (context, index) {
                      final Product product = allProducts[index];
                      return InkWell(
                        onTap: () => Get.toNamed(RoutesName.productDetails, arguments: product),
                        child: ProductCard(product: product),
                      );
                    },
                  ),
                )
              else
                Expanded(
                  child: Center(
                    child: Text(
                      "No Products Found",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.errorContainer,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
