import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart'; // GetX Controller
import '../routes.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6829A7),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', width: 100, height: 100),
              SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Snap',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.yellow),
                    ),
                    TextSpan(
                      text: 'Bite',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text('Login', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: 20),
              TextField(
                controller: authController.emailController,
                decoration: InputDecoration(
                  hintText: 'Your Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(height: 15),
              Obx(() => TextField(
                controller: authController.passwordController,
                obscureText: authController.isPasswordHidden.value,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  suffixIcon: IconButton(
                    icon: Icon(authController.isPasswordHidden.value ? Icons.visibility_off : Icons.visibility),
                    onPressed: authController.togglePasswordVisibility,
                  ),
                ),
              )),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: authController.login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Obx(() => authController.isLoading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Login', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white))),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member? ', style: TextStyle(color: Colors.white, fontSize: 16)),
                  TextButton(
                    onPressed: () => Get.toNamed(AppRoutes.signup),
                    child: Text('Register here', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: authController.loginWithFacebook,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    label: Text('Login with Facebook', style: TextStyle(color: Colors.purple)),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: authController.loginWithGoogle,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    icon: Icon(Icons.g_mobiledata, color: Colors.red),
                    label: Text('Login with Google', style: TextStyle(color: Colors.purple)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
