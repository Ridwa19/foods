import 'package:get/get.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/reset_password_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/item_detail_screen.dart';
import 'screens/cart_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const resetPassword = '/reset-password';
  static const menu = '/menu';
  static const itemDetails = '/item-details';
  static const cart = '/cart';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signup,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: resetPassword,
      page: () => ResetPasswordScreen(),
    ),
    GetPage(
      name: menu,
      page: () => MenuScreen(),
    ),
    GetPage(
      name: itemDetails,
      page: () => ItemDetailScreen(
        item: Get.arguments, // Pass the item dynamically using Get.arguments
      ),
    ),
    GetPage(
      name: cart,
      page: () => CartScreen(),
    ),
  ];
}
