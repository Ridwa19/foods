import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/item_detail_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/reset_password_screen.dart';

void main() {
  runApp(SnapBiteApp());
}

class SnapBiteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/menu': (context) => MenuScreen(),
        '/itemDetail': (context) => ItemDetailScreen(),
        '/cart': (context) => CartScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/resetPassword': (context) => ResetPasswordScreen(),
      },
    );
  }
}
