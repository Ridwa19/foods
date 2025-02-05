import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <Map<String, dynamic>>[].obs;

  // Calculate the total price of items in the cart
  double calculateTotal() {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  // Add an item to the cart
  void addItem(Map<String, dynamic> item) {
    final index = cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (index != -1) {
      cartItems[index]['quantity']++;
    } else {
      cartItems.add({...item, 'quantity': 1});
    }
  }

  // Clear all items from the cart
  void clearCart() {
    cartItems.clear();
  }
}
