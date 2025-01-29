import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = [].obs;

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  void addItem(Map<String, dynamic> item) {
    cartItems.add(item);
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }
}
