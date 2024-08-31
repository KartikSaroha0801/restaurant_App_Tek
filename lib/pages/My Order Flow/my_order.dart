import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/add_to_cart.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/homepage.dart';
import 'package:restaurent_app_tek/pages/My%20Order%20Flow/order_status.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/my_profile.dart';
import 'package:restaurent_app_tek/widgets/custom_bottom_nav_bar.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({super.key});

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  int _currentIndex = 2; // My Order tab is selected

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to the corresponding page based on the index
    if (index == 0) {
      Get.offAll(() => HomePage()); // Replace with your Home page route
    } else if (index == 1) {
      // Get.offAll(() =>AddToCartPage()); // Replace with your Cart page route
    } else if (index == 2) {
      Get.offAll(() =>MyOrderPage());
    } else if (index == 3) {
      Get.offAll(() => MyProfile());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 14, top: 7, bottom: 7),
              child: Container(
                width: 35,
                height: 35,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const Icon(Icons.arrow_back_ios, color: Colors.black),
              ),
            ),
          ),
          title: const Center(
            child: Padding(
              padding: EdgeInsets.only(right: 50),
              child: Text(
                "My Order",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
            tabs: [
              Tab(text: "Active"),
              Tab(text: "Previous"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Active Tab Content
            ActiveOrdersTab(),
            // Previous Tab Content
            PreviousOrdersTab(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}

class ActiveOrdersTab extends StatelessWidget {
  const ActiveOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OrderCard(
          imageUrl: 'assets/images/burger.png', // Use your asset image here
          title: 'Bacon Burger King',
          subtitle: 'yahoo comida',
          price: '₹ 150',
          buttonText: 'View Status',
        ),
      ),
    );
  }
}

class PreviousOrdersTab extends StatelessWidget {
  const PreviousOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          OrderCard(
            imageUrl: 'assets/images/burger.png', // Use your asset image here
            title: 'Bacon Burger King',
            subtitle: 'yahoo comida',
            price: '₹ 150',
            buttonText: 'Reorder',
          ),
          OrderCard(
            imageUrl: 'assets/images/burger.png', // Use your asset image here
            title: 'Bacon Burger King',
            subtitle: 'yahoo comida',
            price: '₹ 150',
            buttonText: 'Reorder',
          ),
          OrderCard(
            imageUrl: 'assets/images/burger.png', // Use your asset image here
            title: 'Bacon Burger King',
            subtitle: 'yahoo comida',
            price: '₹ 150',
            buttonText: 'Reorder',
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;
  final String buttonText;

  const OrderCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.buttonText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // White background for the card
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl,
                width: 50, height: 50), 
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(subtitle),
                  const SizedBox(height: 10),
                  Text(price,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Stack(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => OrderStatusPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: Text(buttonText,
                      style: const TextStyle(color: Colors.white)),
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Handle delete action
                    },
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
