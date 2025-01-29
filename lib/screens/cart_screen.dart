import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {"name": "Beef Burger", "price": 20, "quantity": 1},
    {"name": "Noodles", "price": 15, "quantity": 2},
  ];

  double calculateTotal() {
    return cartItems.fold(
        0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(item['name']),
                            subtitle: Text('\$${item['price']} x ${item['quantity']}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Decrease quantity button
                                IconButton(
                                  onPressed: () {
                                    if (item['quantity'] > 1) {
                                      item['quantity']--;
                                      Get.snackbar(
                                        'Quantity Updated',
                                        'Updated ${item['name']} quantity.',
                                        backgroundColor: Colors.green,
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
                                  icon: Icon(Icons.remove_circle_outline),
                                ),
                                // Quantity display
                                Text('${item['quantity']}'),
                                // Increase quantity button
                                IconButton(
                                  onPressed: () {
                                    item['quantity']++;
                                    Get.snackbar(
                                      'Quantity Updated',
                                      'Updated ${item['name']} quantity.',
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                    );
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
                  // Total Price and Proceed to Checkout
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${calculateTotal()}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the checkout screen
                            Get.snackbar(
                              'Proceeding to Checkout',
                              'Redirecting to payment gateway...',
                              backgroundColor: Colors.blue,
                              colorText: Colors.white,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Proceed to Checkout',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
