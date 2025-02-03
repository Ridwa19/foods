import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String searchQuery = '';
  String selectedCategory = 'All';

  final List<Map<String, String>> menuItems = [
    {"name": "Beef Burger", "price": "20", "image": "assets/beef_burger.png", "category": "Burger"},
    {"name": "Pizza-Tikka", "price": "30", "image": "assets/pizza_tikka.png", "category": "Pizza"},
    {"name": "Ice Cream", "price": "15", "image": "assets/ice_cream.png", "category": "Dessert"},
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredItems = menuItems
        .where((item) =>
    (selectedCategory == 'All' || item['category'] == selectedCategory) &&
        item['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFFFFF7F3), // Adjusted background color
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150), // Adjust height
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 10, offset: Offset(0, 5)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Menu',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        Text(
                          'SnapBite - Feast The Essence',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/profile_image.png'),
                    ),
                  ],
                ),
                SizedBox(height: 10),

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
                    fillColor: Color(0xFFF8E1F4),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Categories Section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCategory('All', Icons.fastfood),
                    buildCategory('Pizza', Icons.local_pizza),
                    buildCategory('Burger', Icons.lunch_dining),
                    buildCategory('Dessert', Icons.cake),
                    buildCategory('Ice Cream', Icons.icecream),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Promotions Section
              Text(
                'Promotions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Offer",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
                    Image.asset('assets/fries.png', height: 80, width: 80, fit: BoxFit.contain),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Popular Items Section
              Text(
                'Popular',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
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
              SizedBox(height: 20),

              // Deals Section
              Text(
                'Make Your Own Deal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        ],
      ),
    );
  }

  Widget buildCategory(String category, IconData icon) {
    bool isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            SizedBox(width: 5),
            Text(
              category,
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
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
          Icon(Icons.add_circle, color: Colors.purple),
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
        color: Colors.purple,
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
