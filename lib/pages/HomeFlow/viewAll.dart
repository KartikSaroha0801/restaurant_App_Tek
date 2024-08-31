import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/categoryRestaurantList.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';
import 'package:restaurent_app_tek/widgets/searchbar.dart';


class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> dishes = [
    {'name': 'Biryani', 'imagePath': 'assets/images/biryani.png'},
    {'name': 'Dosa', 'imagePath': 'assets/images/dosa.png'},
    {'name': 'Pizza', 'imagePath': 'assets/images/pizza.png'},
    {'name': 'Burger', 'imagePath': 'assets/images/burger.png'},
    {'name': 'Idli', 'imagePath': 'assets/images/idli.png'},
    {'name': 'Rolls', 'imagePath': 'assets/images/rolls.png'},
    {'name': 'Chicken', 'imagePath': 'assets/images/chicken.png'},
    {'name': 'Shawarma', 'imagePath': 'assets/images/shawarma.png'},
  ];

  List<Map<String, String>> filteredDishes = [];

  @override
  void initState() {
    super.initState();
    filteredDishes = List.from(dishes);

    _searchController.addListener(() {
      filterDishes();
    });
  }

  void filterDishes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredDishes = List.from(dishes);
      } else {
        filteredDishes = dishes.where((dish) {
          final name = dish['name']!.toLowerCase();
          return name.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBAR(title: "Dishes"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomSearchPage(
                  searchController: _searchController,
                  filledColor: '0xFFFFF2F2',
                  hintText: "Search",
                  onSearch: (String value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: filteredDishes.map((dish) {
                    return GestureDetector(
                      onTap: () {
                        // if (dish['name'] == 'Burger') {
                        //  Get.to(() => CategoryRestaurantList());
                        // }
                        Get.to(() => CategoryRestaurantList());
                      },
                      child: dishCategory(dish['name']!, dish['imagePath']!),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
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
            fontWeight: FontWeight.w500,
            color: Color(0xFF988F8F),
          ),
        ),
      ],
    );
  }
}
