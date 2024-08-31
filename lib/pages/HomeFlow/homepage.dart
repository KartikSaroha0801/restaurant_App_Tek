import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/add_to_cart.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/notification.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/viewAll.dart';
import 'package:restaurent_app_tek/pages/My%20Order%20Flow/my_order.dart';
import 'package:restaurent_app_tek/pages/ProfileFlow/my_profile.dart';
import 'package:restaurent_app_tek/widgets/custom_bottom_nav_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/notification.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigate to the corresponding page based on the index
    if (index == 0) {
      Get.offAll(() => HomePage()); // Replace with your Home page route
    } else if (index == 1) {
      // Get.offAll(() => AddToCartPage()); // Replace with your Cart page route
    } else if (index == 2) {
      Get.offAll(() => MyOrderPage()); // Replace with your My Order page route
    } else if (index == 3) {
      // Navigate to Profile page
      Get.offAll(() => MyProfile()); // Replace with your Profile page route
    }
  }

  List<Map<String, String>> restaurants = [
    {
      'name': 'Burger King',
      'category': 'Burger Pizza Fast Food',
      'time': '15 min',
      'distance': '3 km',
      'logo': 'assets/images/burger_king.png'
    },
    {
      'name': 'Domino\'s Pizza',
      'category': 'Pizza Fast Food',
      'time': '15 min',
      'distance': '3 km',
      'logo': 'assets/images/dominos.png'
    },
    {
      'name': 'McDonald\'s',
      'category': 'Burger Pizza Fast Food',
      'time': '15 min',
      'distance': '3 km',
      'logo': 'assets/images/mcdonalds.png'
    },
  ];

  List<Map<String, String>> filteredRestaurants = [];

  @override
  void initState() {
    super.initState();
    filteredRestaurants = List.from(restaurants);

    _searchController.addListener(() {
      filterRestaurants();
    });
  }

  void filterRestaurants() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredRestaurants = List.from(restaurants);
      } else {
        filteredRestaurants = restaurants.where((restaurant) {
          final name = restaurant['name']!.toLowerCase();
          return name.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFFF2F2),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Color(0xFFFFF2F2),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(horizontal: 16),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Your Location",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 8,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.15,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.03),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF988F8F),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16),
                        SizedBox(width: screenWidth * 0.03),
                        Text(
                          "Noida Sector 62",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 10),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => NotificationPage());
                    },
                    child: Image.asset(
                      "assets/images/notification.png",
                      fit: BoxFit.cover,
                      height: screenHeight * 0.03,
                    ),
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search by Restaurant',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight*0.015),
                    Container(
                      height: screenHeight * 0.2,
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              children: [
                                offerCard(),
                                offerCard(),
                                offerCard(),
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight*0.01),
                          SmoothPageIndicator(
                            controller: _pageController,
                            count: 3,
                            effect: SlideEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              activeDotColor: Color(0xFF000000),
                              dotColor: Color(0xFF807979),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight*0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dishes",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.09,
                            ),
                          ),
                          InkWell(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "view all",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.10,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(() => Viewall());
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 10),
                      child: GridView.count(
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          dishCategory('Biryani', 'assets/images/biryani.png'),
                          dishCategory('Dosa', 'assets/images/dosa.png'),
                          dishCategory('Pizza', 'assets/images/pizza.png'),
                          dishCategory('Burger', 'assets/images/burger.png'),
                          dishCategory('Idli', 'assets/images/idli.png'),
                          dishCategory('Rolls', 'assets/images/rolls.png'),
                          dishCategory('Chicken', 'assets/images/chicken.png'),
                          dishCategory(
                              'Shawarma', 'assets/images/shawarma.png'),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(16),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         filterButton('All', true),
                    //         filterButton('Near by', false),
                    //         filterButton('Delivery Free', false),
                    //         filterButton('Popular', false),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      width: double.infinity,
                      height: screenHeight*0.04,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              height: screenHeight*0.04,
                              width: screenWidth*0.17,
                              padding:
                                  const EdgeInsets.only(top: 12, bottom: 13),
                              clipBehavior: Clip.antiAlias,
                              decoration:
                                  BoxDecoration(color: Color(0xFFFF3A30)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'All',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 80,
                            top: 17,
                            child: Text(
                              'Near by',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 162,
                            top: 17,
                            child: Text(
                              'Delivery Free',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 285,
                            top: 17,
                            child: Text(
                              'Popular',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight*0.02),
                    Column(
                      children: filteredRestaurants.isNotEmpty
                          ? filteredRestaurants.map((restaurant) {
                              return restaurantCard(
                                restaurant['name']!,
                                restaurant['category']!,
                                restaurant['time']!,
                                restaurant['distance']!,
                                restaurant['logo']!,
                              );
                            }).toList()
                          : [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'No restaurants found',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  Widget offerCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/images/offercard.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget dishCategory(String name, String imagePath) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          height: 60,
        ),
        Text(
          name,
          style: TextStyle(
            color: Colors.black.withOpacity(0.699999988079071),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // Widget filterButton(String title, bool isSelected) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(16),
  //       color: isSelected ? Colors.pink : Colors.transparent,
  //     ),
  //     child: Center(
  //       child: Text(
  //         title,
  //         style: TextStyle(
  //           color: isSelected ? Colors.white : Colors.black,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget restaurantCard(String name, String category, String time,
      String distance, String logoPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              child: Image.asset(
                logoPath,
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(category),
                Row(
                  children: [
                    // Icon(Icons.access_time, size: 16),
                    Image.asset("assets/images/clock.png"),
                    SizedBox(width: 4),
                    Text(time),
                    SizedBox(width: 8),
                    // Icon(Icons.location_on, size: 16),
                    Image.asset(
                      "assets/images/dot.png",
                      width: 7,
                      height: 7,
                    ),
                    SizedBox(width: 4),
                    Text(distance),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
