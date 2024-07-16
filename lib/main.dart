import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:spinnerwheel/helper/routes.dart';
import 'package:spinnerwheel/helper/theme_Const.dart';
import 'package:spinnerwheel/src/pages/configuration/configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeMethod(context),
      home:
      // HomePage(), 
      const Configuration(title: 'Flutter Demo Home Page'),
      getPages: Routes.pages,
    );
  }
}

