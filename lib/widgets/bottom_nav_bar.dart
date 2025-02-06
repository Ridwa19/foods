import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final VoidCallback? onSearchPressed;

  const BottomNavBar({
    required this.currentIndex,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

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
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const Icon(Icons.shopping_cart),
              Obx(() {
                if (cartController.totalItemCount.value > 0) {
                  return Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cartController.totalItemCount.value}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
          label: "",
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "",
        ),
      ],
    );
  }
}
