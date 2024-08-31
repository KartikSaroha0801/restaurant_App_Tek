import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/productDescription.dart';
import 'package:restaurent_app_tek/widgets/app_bar.dart';
import 'package:restaurent_app_tek/widgets/searchbar.dart';

class Product {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double originalPrice;
  final bool isBestseller;
  final bool isOnSale;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.isBestseller,
    required this.isOnSale,
  });
}

final List<Product> products = [
  Product(
    name: 'Bacon Burger',
    description: 'yahoo comida',
    imageUrl: 'assets/images/bacon_burger.png',
    price: 170.0,
    originalPrice: 283.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'BK Pizza Puff',
    description: 'Crispy savoury pastry',
    imageUrl: 'assets/images/bk_pizza_puff.png',
    price: 126.0,
    originalPrice: 210.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Veggie Strips-5 pcs',
    description: 'Vegetarians Fingers',
    imageUrl: 'assets/images/veggie_strip.png',
    price: 108.0,
    originalPrice: 180.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Fanta Medium',
    description: 'Fanta',
    imageUrl: 'assets/images/fanta.png',
    price: 120.0,
    originalPrice: 200.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Fries (Medium)',
    description: 'Crispy partner',
    imageUrl: 'assets/images/fries_medium.png',
    price: 112.0,
    originalPrice: 220.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Sprite Medium',
    description: 'Sprite',
    imageUrl: 'assets/images/sprite.png',
    price: 126.0,
    originalPrice: 210.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Coca Cola Medium',
    description: 'Coca Cola',
    imageUrl: 'assets/images/coca_cola.png',
    price: 150.0,
    originalPrice: 250.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Sprite Large',
    description: 'Sprite',
    imageUrl: 'assets/images/sprite.png',
    price: 112.0,
    originalPrice: 220.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Thumbs up Medium',
    description: 'Thumbs up',
    imageUrl: 'assets/images/thums_up.png',
    price: 108.0,
    originalPrice: 180.0,
    isBestseller: true,
    isOnSale: true,
  ),
  Product(
    name: 'Coca Cola Large',
    description: 'Coca Cola',
    imageUrl: 'assets/images/coca_cola.png',
    price: 106.0,
    originalPrice: 190.0,
    isBestseller: true,
    isOnSale: true,
  ),
];

class ProductListingPage extends StatefulWidget {
  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  final TextEditingController searchController = TextEditingController();
  List<Product> filteredProducts = products;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredProducts = products.where((product) {
        return product.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount =
        screenWidth > 600 ? 3 : 2; // 3 columns if screen width > 600, else 2

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            AppBAR(title: "Burger King"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: CustomSearchPage(
                searchController: searchController,
                filledColor: '0xFFFFF2F2',
                hintText: 'Search',
                onSearch: (query) {},
              ),
            ),
            SizedBox(height: screenHeight*0.02),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: screenWidth > 600 ? 0.8 : 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Stack(
                      children: [
                        Container(
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x33000000),
                                blurRadius: 4,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    product.imageUrl,
                                    height: screenWidth > 600
                                        ? 180
                                        : 120, // Adjust image height based on screen size
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  product.description,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '₹${product.price}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth > 600
                                                ? 16
                                                : 14, // Adjust font size based on screen size
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '₹${product.originalPrice}',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: screenWidth > 600
                                                ? 16
                                                : 14, // Adjust font size based on screen size
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => ProductDescriptionPage());
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 27,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          border: Border.all(
                                            color: Color(0xFFCCCCCC),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "ADD",
                                            style: TextStyle(
                                                color: Color(0xFF5FB12C),
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (product.isBestseller)
                          Positioned(
                            top: 13,
                            child: Image.asset(
                              "assets/images/bestseller.png",
                              width: screenWidth > 600
                                  ? 80
                                  : 60, // Adjust image size based on screen size
                            ),
                          ),
                        if (product.isOnSale)
                          Positioned(
                            top: 8,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: Text(
                                '40% off',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: screenWidth > 600
                                      ? 14
                                      : 12, // Adjust font size based on screen size
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
