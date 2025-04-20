import 'package:e_com_task/src/core/router/routes_name.dart';
import 'package:e_com_task/src/features/explore_products/presentation/binding/product_bindings.dart';
import 'package:e_com_task/src/features/explore_products/presentation/view/home_screen.dart';
import 'package:e_com_task/src/features/explore_products/presentation/view/product_details_screen.dart';
import 'package:e_com_task/src/features/shared/presentation/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(name: RoutesName.splash, page: () => SplashScreen()),
    GetPage(name: RoutesName.home, page: () => HomeScreen(), bindings: [ProductBindings()]),
    GetPage(name: RoutesName.productDetails, page: () => ProductDetailsPage()),
  ];
}
