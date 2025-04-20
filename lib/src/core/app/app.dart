import 'package:e_com_task/src/core/router/app_routes.dart';
import 'package:e_com_task/src/core/router/routes_name.dart';
import 'package:e_com_task/src/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:bot_toast/bot_toast.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.pages,
      initialRoute: RoutesName.splash,
      theme: AppTheme.lightTheme,
      builder: BotToastInit(),
    );
  }
}
