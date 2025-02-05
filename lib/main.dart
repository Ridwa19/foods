import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'controllers/cart_controller.dart';
import 'package:food/controllers/auth_controller.dart'; // ✅ Import the AuthController



void main() {
  runApp(MyApp());
  Get.put(CartController()); // Register CartController
  Get.put(AuthController()); // Inject controller globally

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
