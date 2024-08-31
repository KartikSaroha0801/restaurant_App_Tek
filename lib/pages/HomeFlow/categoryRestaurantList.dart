import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/productlist.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';

class CategoryRestaurantList extends StatefulWidget {
  const CategoryRestaurantList({super.key});

  @override
  State<CategoryRestaurantList> createState() => _CategoryRestaurantListState();
}

class _CategoryRestaurantListState extends State<CategoryRestaurantList> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> restaurants = [
    {
      'name': 'Burger King',
      'category': 'Burger Pizza Fast Food',
      'time': '15 min',
      'distance': '3 km',
      'logo': 'assets/images/burger_king_banner.png',
      'freeDelivery': 'true',
    },
    {
      'name': 'KFC',
      'category': 'Burger Pizza Fast Food',
      'time': '15 min',
      'distance': '3 km',
      'logo': 'assets/images/kfc_banner.png',
      'freeDelivery': 'false',
    },
    {
      'name': 'McDonald\'s',
      'category': 'Burger Pizza Fast Food',
      'time': '15 min',
      'distance': '3 km',
      'logo': 'assets/images/mcdonalds_banner.png',
      'freeDelivery': 'false',
    },
    {
      'name': 'Louis Burger',
      'category': 'Burger Pizza Fast Food',
      'time': '15 min',
      'distance': '3 km',
      'logo': 'assets/images/louis_burger_banner.png',
      'freeDelivery': 'true',
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBAR(title: "Burger"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by Restaurant',
                  filled: true,
                  fillColor: Color(0xFFFFF2F2),
                  prefixIcon: Icon(Icons.search, color: Colors.black54),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredRestaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = filteredRestaurants[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(ProductListingPage());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(12), bottom: Radius.circular(12),),
                                  child: Image.asset(
                                    restaurant['logo']!,
                                    height: screenHeight*0.2,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (restaurant['freeDelivery'] == 'true')
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Free Delivery',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant['name']!,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    restaurant['category']!,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight*0.01),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, size: 16, color: Colors.red),
                                      SizedBox(width: screenWidth*0.01),
                                      Text(
                                        restaurant['time']!,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(width: screenWidth*0.04),
                                      Icon(Icons.location_on, size: 16, color: Colors.red),
                                      SizedBox(width: screenWidth*0.01),
                                      Text(
                                        restaurant['distance']!,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}





 // child: Stack(
                      //   children: [
                      //     Container(
                      //       height: 220,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(12),
                      //         boxShadow: [
                                
                      //           BoxShadow(
                      //             color: Colors.black26,
                      //             offset: Offset(0, 4),
                      //             blurRadius: 6,
                      //           ),
                      //         ],
                      //       ),
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(12),
                      //         child: Image.asset(
                      //           restaurant['logo']!,
                      //           height: 150,
                      //           width: double.infinity,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //     ),
                      //     Positioned(
                      //       top: 10,
                      //       left: 10,
                      //       child: restaurant['freeDelivery'] == 'true'
                      //           ? Container(
                      //               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      //               decoration: BoxDecoration(
                      //                 color: Colors.red,
                      //                 borderRadius: BorderRadius.circular(12),
                      //               ),
                      //               child: Text(
                      //                 'Free Delivery',
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             )
                      //           : SizedBox.shrink(),
                      //     ),
                      //     Positioned(
                      //       bottom: -10,
                      //       left: 10,
                      //       right: 10,
                      //       child: Container(
                      //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(12),
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: Colors.black12,
                      //               offset: Offset(0, 2),
                      //               blurRadius: 4,
                      //             ),
                      //           ],
                      //         ),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //             Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   restaurant['name']!,
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.bold,
                      //                     fontSize: 16,
                      //                   ),
                      //                 ),
                      //                 SizedBox(height: 4),
                      //                 Text(
                      //                   restaurant['category']!,
                      //                   style: TextStyle(
                      //                     color: Colors.grey[600],
                      //                     fontSize: 12,
                      //                   ),
                      //                 ),
                      //                 SizedBox(height: 4),
                      //                 Row(
                      //                   children: [
                      //                     Icon(Icons.access_time, size: 14, color: Colors.red),
                      //                     SizedBox(width: 4),
                      //                     Text(
                      //                       restaurant['time']!,
                      //                       style: TextStyle(
                      //                         color: Colors.grey[600],
                      //                         fontSize: 12,
                      //                       ),
                      //                     ),
                      //                     SizedBox(width: 10),
                      //                     Icon(Icons.location_on, size: 14, color: Colors.red),
                      //                     SizedBox(width: 4),
                      //                     Text(
                      //                       restaurant['distance']!,
                      //                       style: TextStyle(
                      //                         color: Colors.grey[600],
                      //                         fontSize: 12,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),