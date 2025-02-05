import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  // Controllers for email and password inputs
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observables for password visibility and loading state
  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  // Login function with navigation
  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please enter email and password",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2)); // Simulating network request
    isLoading.value = false;

    // Show success message
    Get.snackbar("Login", "Login successful!",
        snackPosition: SnackPosition.BOTTOM);

    // Navigate to the menu screen after login
    Get.offNamed('/menu'); // This removes the login screen from the stack
  }

  // Dummy Social Media Login (replace with Firebase or API integration)
  void loginWithGoogle() {
    Get.snackbar("Google Login", "Logged in with Google!",
        snackPosition: SnackPosition.BOTTOM);
    Get.offNamed('/menu'); // Navigate to menu after login
  }

  void loginWithFacebook() {
    Get.snackbar("Facebook Login", "Logged in with Facebook!",
        snackPosition: SnackPosition.BOTTOM);
    Get.offNamed('/menu'); // Navigate to menu after login
  }
}
