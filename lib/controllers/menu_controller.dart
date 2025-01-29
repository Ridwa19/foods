import 'package:get/get.dart';

class MenuController extends GetxController {
  var menuItems = [].obs;

  void fetchMenu() {
    // Replace with API call
    menuItems.value = [
      {'name': 'Beef Burger', 'price': 20, 'image': 'assets/beef_burger.png'},
      {'name': 'Pizza Tikka', 'price': 30, 'image': 'assets/pizza_tikka.png'},
    ];
  }
}
