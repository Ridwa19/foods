import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottom_nav_bar.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String searchQuery = '';
  String selectedCategory = 'All';
  final FocusNode _searchFocusNode = FocusNode();

  final List<Map<String, String>> menuItems = [
    {"name": "Beef Burger", "price": "20", "image": "assets/fast-food-burger-5 2.png", "category": "Burger"},
    {"name": "Pizza-Tikka", "price": "30", "image": "assets/pizza.png", "category": "Pizza"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredItems = menuItems
        .where((item) =>
    (selectedCategory == 'All' || item['category'] == selectedCategory) &&
        item['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            buildHeader(),
            SizedBox(height: 20),

            // Categories Section
            buildCategories(),
            SizedBox(height: 20),

            // Promotions Section
            buildPromotions(),
            SizedBox(height: 20),

            // Popular Items Section
            buildPopularItems(filteredItems),
            SizedBox(height: 20),

            // Make Your Own Deal Section
            buildMakeYourOwnDeal(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onSearchPressed: () {
          _searchFocusNode.requestFocus();
        },
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Profile
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/Mask group.png'),
              ),
            ],
          ),
          Text(
            'SnapBite - Feast The Essence',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),

          // Search Bar
          TextField(
            focusNode: _searchFocusNode,
            onChanged: (value) {
              setState(() {
                searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search your desired meal here...',
              prefixIcon: Icon(Icons.search, color: Colors.purple),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildCategory('All', 'assets/grill-chicken-spicy 1.png', isSelected: selectedCategory == 'All'),
            buildCategory('Pizza', 'assets/pizza-slice.png', isSelected: selectedCategory == 'Pizza'),
            buildCategory('Burger', 'assets/fast-food-burger-5 2.png', isSelected: selectedCategory == 'Burger'),
            buildCategory('Dessert', 'assets/meringue 1.png', isSelected: selectedCategory == 'Dessert'),
            buildCategory('Ice Cream', 'assets/ice-cream-68 1@2x.png', isSelected: selectedCategory == 'Ice Cream'),
          ],
        ),
      ),
    );
  }

  Widget buildPromotions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promotions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Offer",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.yellow),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Free Box of Fries!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'on all orders above \$150',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset('assets/fries-8 1@2x.png', height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPopularItems(List<Map<String, String>> filteredItems) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return buildMenuItem(filteredItems[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget buildMakeYourOwnDeal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Make Your Own Deal',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buildDealCard('King Size Burger + Fries + Coke', '75', 'assets/chickenburger (1) 1.png', Colors.deepPurple),
                buildDealCard('King Size Chicken + Fries + Coke', '99', 'assets/chickenburger (1) 1.png', Colors.deepPurple),
                buildDealCard('Ice Cream Combo', '99', 'assets/ice-cream-68 1@2x.png', Colors.deepPurple),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDealCard(String title, String price, String imagePath, Color backgroundColor) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 80),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text('\$$price', style: TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildCategory(String category, String imagePath, {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.deepPurple[100] : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imagePath, height: 50, width: 50),
          ),
          Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.deepPurple : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(Map<String, String> item) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item['image']!, height: 80, width: 80, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(item['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
          Text('\$${item['price']}', style: TextStyle(color: Colors.green)),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                '/item-details',
                arguments: item,
              );
            },
            child: Icon(Icons.add_circle, color: Colors.deepPurple, size: 30),
          ),
        ],
      ),
    );
  }
}
