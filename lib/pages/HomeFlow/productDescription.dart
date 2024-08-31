import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurent_app_tek/controllers/product_controller.dart';
import 'package:restaurent_app_tek/controllers/cartController.dart';
import 'package:restaurent_app_tek/pages/HomeFlow/add_to_cart.dart';

class ProductDescriptionPage extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/burger_product.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  top: 38,
                  left: 16,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bacon Burger King",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹170",
                            style: TextStyle(
                              color: Color(0xFFFF3A30),
                              fontSize: 19,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "₹283",
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 19,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF9601),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "40% off",
                      style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,

        ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Color(0xFFFE3D58)),
            Container(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "There are many variations of passages of Lorem Ipsum available, "
                "but the majority have suffered in some form, by injected humour, "
                "or randomised words which don’t look use...",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Poppins",
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              color: Color(0xFFF5F5F5),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Toppings",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 10),
                    Obx(() => Column(
                          children:
                              controller.toppingPrices.keys.map((topping) {
                            return ToppingOption(
                              topping,
                              controller.toppingPrices[topping]!,
                              controller.selectedToppings[topping]!,
                              (bool? value) {
                                controller.toggleTopping(topping, value!);
                              },
                            );
                          }).toList(),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  QuantitySelector(),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Total price",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                           fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(width: 25),
                      Obx(
                        () => Text(
                          "₹${controller.totalPrice.value.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFF3A30),
                             fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Access the ProductController instance
                        ProductController productController =
                            Get.find<ProductController>();

                        // Add item to the cart with the correct total price
                        cartController.addItem(
                          "Bacon Burger King",
                          productController.totalPrice.value.toInt(),
                        );

                        Get.to(() => AddToCartPage());
                      },
                      child: Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                           fontFamily: "Poppins",
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(
                          color: Color(0xFFFF3A30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Place order",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                             fontFamily: "Poppins",),
                            
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFF3A30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ToppingOption extends StatelessWidget {
  final String name;
  final int price;
  final bool isSelected;
  final ValueChanged<bool?> onChanged;

  ToppingOption(this.name, this.price, this.isSelected, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Row(
          children: [
            Text("₹$price"),
            Checkbox(value: isSelected, onChanged: onChanged, activeColor: Color(0xFFFE3D58),),
          ],
        ),
      ],
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Quantity",
          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500,  fontFamily: "Poppins",),
        ),
        SizedBox(width: 25),
        GestureDetector(
          onTap: () => controller.decreaseQuantity(),
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              color: Color(0xFF5FB132),
            ),
            child: Center(
              child: Text(
                "-",
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(width: 7),
        Obx(() => Text("${controller.quantity.value}")),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () => controller.increaseQuantity(),
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              color: Color(0xFF5FB132),
            ),
            child: Center(
              child: Text(
                "+",
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
