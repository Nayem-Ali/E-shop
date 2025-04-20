import 'package:e_com_task/src/core/app/app.dart';
import 'package:e_com_task/src/core/dependency_injection/dl.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  runApp(const App());
}

