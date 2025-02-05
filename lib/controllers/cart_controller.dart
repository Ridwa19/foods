import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <Map<String, dynamic>>[].obs;

  double calculateTotal() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  void addItem(Map<String, dynamic> item) {
    final index = cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (index != -1) {
      cartItems[index]['quantity']++;
    } else {
      cartItems.add({...item, 'quantity': 1});
    }
  }
}
