import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String searchQuery = '';
  String selectedCategory = 'All';

  final List<Map<String, String>> menuItems = [
    {"name": "Beef Burger", "price": "20", "image": "assets/fast-food-burger-5 2.png", "category": "Burger"},
    {"name": "Pizza-Tikka", "price": "30", "image": "assets/pizza.png", "category": "Pizza"},
  ];

  int selectedBottomIndex = 0;

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
            Container(
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
                        backgroundImage: AssetImage('assets/profile_image.png'),
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
            ),
            SizedBox(height: 20),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCategory('All', 'assets/grill-chicken-spicy 1.png', isSelected: true),
                    buildCategory('Pizza', 'assets/pizza-slice.png'),
                    buildCategory('Burger', 'assets/fast-food-burger-5 2.png'),
                    buildCategory('Dessert', 'assets/meringue 1.png'),
                    buildCategory('Ice Cream', 'assets/ice-cream-68 1@2x.png'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Promotions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Offer",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Free Box of Fries!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'on all orders above \$150',
                          style: TextStyle(color: Colors.yellowAccent, fontSize: 14),
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset('assets/fries.png', height: 80, width: 80),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Popular Items Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Popular',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
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
            ),
            SizedBox(height: 20),

            // Make Your Own Deal Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Make Your Own Deal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  buildDealCard('King Size Burger + Fries + Coke', '\$75'),
                  buildDealCard('King Size Chicken + Fries + Coke', '\$99'),
                  buildDealCard('King Size Meal + Ice Cream', '\$99'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomIndex,
        onTap: (index) {
          setState(() {
            selectedBottomIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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
              color: isSelected ? Colors.purple[100] : Colors.grey[200],
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
          Icon(Icons.add_circle, color: Colors.deepPurple),
        ],
      ),
    );
  }

  Widget buildDealCard(String title, String price) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(8),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            price,
            style: TextStyle(color: Colors.yellowAccent, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
