import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <Map<String, dynamic>>[].obs;
  final totalItemCount = 0.obs;

  // Calculate the total price of items in the cart
  double calculateTotal() {
    return cartItems.fold(0.0, (sum, item) {
      double addOnTotal = 0.0;
      if (item['addOns'] != null) {
        (item['addOns'] as Map<String, int>).forEach((key, value) {
          addOnTotal += value * 9; // Assuming all add-ons cost $9 each
        });
      }
      return sum + (item['price'] * item['quantity']) + addOnTotal;
    });
  }

  // Add an item to the cart with add-ons
  void addItem(Map<String, dynamic> item) {
    final index = cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
    if (index != -1) {
      cartItems[index]['quantity']++;
    } else {
      cartItems.add({...item, 'quantity': 1, 'addOns': item['addOns'] ?? {}});
    }
    updateItemCount();
  }

  // Clear all items from the cart
  void clearCart() {
    cartItems.clear();
    updateItemCount();
  }

  // Update the total item count
  void updateItemCount() {
    totalItemCount.value = cartItems.fold<int>(0, (sum, item) => sum + (item['quantity'] as int));
  }
}
