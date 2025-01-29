import 'package:flutter/material.dart';

class ItemDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/burger.png', // Replace with your image
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Beef Burger',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$20',
              style: TextStyle(fontSize: 18, color: Colors.orange),
            ),
            SizedBox(height: 10),
            Text(
              'Big juicy beef burger with cheese, lettuce, tomato, onions, and special sauce!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Add To Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
