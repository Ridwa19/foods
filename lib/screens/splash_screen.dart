import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6829A7), // Background color from your design
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Name with SnapBite logo
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Snap',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  TextSpan(
                    text: 'Bite',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Circular Image with White Background
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.white, // White background for the circular image
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/grill-chicken-spicy 1.png', // Replace with your circular image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),

            // Tagline
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Enjoy ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                  ),
                  TextSpan(
                    text: 'Your Meal!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Get Started Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login'); // Navigate to Login Screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6829A7), // Match button text color
                ),
              ),
            ),
            SizedBox(height: 20),

            // Unique Creative Feature: Animated Tagline
            AnimatedTagline(),
          ],
        ),
      ),
    );
  }
}

// Unique Creative Feature: Animated Tagline Widget
class AnimatedTagline extends StatefulWidget {
  @override
  _AnimatedTaglineState createState() => _AnimatedTaglineState();
}

class _AnimatedTaglineState extends State<AnimatedTagline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Text(
        'Savor Every Bite 🍴',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
