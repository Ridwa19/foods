import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Your Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset('assets/images/noodles.png', height: 50), // Replace with your image
              title: Text('Noodles'),
              subtitle: Text('\$9'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Remove item logic
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: Image.asset('assets/images/burger.png', height: 50), // Replace with your image
              title: Text('Beef Burger'),
              subtitle: Text('\$20'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  // Remove item logic
                },
              ),
            ),
            Divider(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Proceed to checkout logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
