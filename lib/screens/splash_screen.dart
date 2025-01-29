import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Redirect to login or menu based on authentication status
      bool isLoggedIn = false; // Replace with actual authentication logic
      if (isLoggedIn) {
        Get.offNamed(AppRoutes.menu); // Navigate to Menu
      } else {
        Get.offNamed(AppRoutes.login); // Navigate to Login
      }
    });

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/chicken.png', // Place your logo in assets folder
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'SnapBite',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Enjoy Your Meal!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
