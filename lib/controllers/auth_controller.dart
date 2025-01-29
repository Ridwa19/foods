import 'package:get/get.dart';

class AuthController extends GetxController {
  var isAuthenticated = false.obs;

  void login(String email, String password) {
    // Replace with API call
    isAuthenticated.value = true;
  }

  void logout() {
    isAuthenticated.value = false;
  }
}
