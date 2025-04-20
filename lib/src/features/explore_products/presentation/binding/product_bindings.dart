import 'package:e_com_task/src/features/explore_products/presentation/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
  }
}
