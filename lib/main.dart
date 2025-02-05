import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'controllers/cart_controller.dart';


void main() {
  runApp(MyApp());
  Get.put(CartController()); // Register CartController

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnapBite',
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,

    );
  }
}
