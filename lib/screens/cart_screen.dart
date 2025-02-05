import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../widgets/bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  // Function to display a custom success dialog
  void _showOrderSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(height: 20),
                Text(
                  "Order Confirmed",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Thank you! Your order has been placed successfully.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    Get.toNamed('/menu'); // Navigate back to menu
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Text(
                    "OK",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _submitOrder(BuildContext context) async {
    if (cartController.cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Your cart is empty!')),
      );
      return;
    }

    // Show a loading Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Submitting your order...')),
    );

    await Future.delayed(Duration(seconds: 2)); // Simulate network delay

    // Clear the cart after submitting
    cartController.clearCart();

    // Show success dialog
    _showOrderSuccessDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${cartController.cartItems.length} Items in cart',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
          ],
        ),
      ),
      body: Obx(() {
        return cartController.cartItems.isEmpty
            ? Center(
          child: Text(
            'Your cart is empty!',
            style: TextStyle(fontSize: 20),
          ),
        )
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartController.cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Item Image
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(item['image'] ?? 'assets/pizza.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Item Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '\$${item['price']}',
                                  style: TextStyle(fontSize: 14, color: Colors.orange),
                                ),
                              ],
                            ),
                          ),
                          // Quantity and Remove
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  cartController.cartItems.removeAt(index);
                                },
                                icon: Icon(Icons.close, color: Colors.red),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (item['quantity'] > 1) {
                                        item['quantity']--;
                                        cartController.cartItems.refresh();
                                      } else {
                                        cartController.cartItems.removeAt(index);
                                      }
                                    },
                                    icon: Icon(Icons.remove_circle_outline, color: Colors.deepPurple),
                                  ),
                                  Text('${item['quantity']}', style: TextStyle(fontSize: 16)),
                                  IconButton(
                                    onPressed: () {
                                      item['quantity']++;
                                      cartController.cartItems.refresh();
                                    },
                                    icon: Icon(Icons.add_circle_outline, color: Colors.deepPurple),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Order Instructions
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Instructions:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write your instructions here...',
                      ),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Proceed to Checkout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () => _submitOrder(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Center(
                  child: Text(
                    'Proceed to Checkout',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            // Back to Menu Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/menu');
                },
                child: Text(
                  '< Back To Menu',
                  style: TextStyle(fontSize: 16, color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
