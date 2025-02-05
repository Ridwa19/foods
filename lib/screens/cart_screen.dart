import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Cart'),
      ),
      body: Obx(() {
        return cartController.cartItems.isEmpty
            ? Center(child: Text('Your cart is empty!', style: TextStyle(fontSize: 20)))
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: ListTile(
                      title: Text(item['name']),
                      subtitle: Text('\$${item['price']} x ${item['quantity']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (item['quantity'] > 1) {
                                item['quantity']--;
                              } else {
                                cartController.cartItems.removeAt(index);
                              }
                            },
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                          Text('${item['quantity']}'),
                          IconButton(
                            onPressed: () {
                              item['quantity']++;
                            },
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('\$${cartController.calculateTotal()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
