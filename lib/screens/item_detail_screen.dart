import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottom_nav_bar.dart';
import '../controllers/cart_controller.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, String> item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.purple),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          // Header Section with Image
          Stack(
            children: [
              Container(
                height: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purpleAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(item['image']!, height: 200, fit: BoxFit.contain),
                ),
              ),
            ],
          ),

          // Details Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  // Rating and Price (Centered)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.purple[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow[700], size: 18),
                            SizedBox(width: 4),
                            Text('4.8', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ),
                      Text(
                        '\$${item['price']}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Item Name
                  Center(
                    child: Text(
                      item['name']!,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Description
                  Center(
                    child: Text(
                      'Big juicy ${item['name']} with cheese, lettuce, tomato, onions, and special sauce!',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Add-Ons Section (Centered)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Add Ons',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildAddOn('assets/cheese-3 1.png', 'Cheese', 9),
                        buildAddOn('assets/images-removebg-preview (1) 1.png', 'Sauce', 9),
                        buildAddOn('assets/schezwan-sauce-recipe-removebg-preview 1.png', 'Ketchup', 9),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Add to Cart Button (Centered)
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addItem({
                          'name': item['name'],
                          'price': double.parse(item['price']!),
                        });
                        Get.toNamed('/cart');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text(
                        'Add To Cart',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }

  // Build Add-On Item Widget
  Widget buildAddOn(String imagePath, String name, int price) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 50, fit: BoxFit.contain),
          SizedBox(height: 5),
          Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle, color: Colors.deepPurple, size: 20),
              SizedBox(width: 5),
              Text(
                '\$$price',
                style: TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
