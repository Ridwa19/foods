import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final VoidCallback? onSearchPressed;

  const BottomNavBar({
    required this.currentIndex,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 1) {
          // Trigger the search callback if the search icon is tapped
          if (onSearchPressed != null) onSearchPressed!();
        } else {
          switch (index) {
            case 0:
              Get.offAllNamed('/menu'); // Navigate to Menu Screen
              break;
            case 2:
              Get.offAllNamed('/cart'); // Navigate to Cart Screen
              break;
            case 3:
              Get.offAllNamed('/profile'); // Navigate to Profile Screen
              break;
          }
        }
      },
      selectedItemColor: Colors.purple,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "",
        ),
      ],
    );
  }
}
