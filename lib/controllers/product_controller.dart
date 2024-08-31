import 'package:get/get.dart';

class ProductController extends GetxController {
  var quantity = 1.obs;
  var totalPrice = 170.0.obs;
  var toppingPrices = {
    "Chipotle Mayo": 20,
    "Hot Sauce": 25,
    "Truffle Mayo": 15,
    "Signature Sauce": 25,
    "Bbq Sauce": 30,
  }.obs;

  var selectedToppings = <String, bool>{}.obs;

  @override
  void onInit() {
    selectedToppings.value = {
      "Chipotle Mayo": false,
      "Hot Sauce": false,
      "Truffle Mayo": false,
      "Signature Sauce": false,
      "Bbq Sauce": false,
    };
    super.onInit();
  }

  void toggleTopping(String topping, bool isSelected) {
    selectedToppings[topping] = isSelected;
    calculateTotalPrice();
  }

  void increaseQuantity() {
    quantity.value++;
    calculateTotalPrice();
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      calculateTotalPrice();
    }
  }

  void calculateTotalPrice() {
    double toppingTotal = 0.0;
    selectedToppings.forEach((key, value) {
      if (value) toppingTotal += toppingPrices[key]!;
    });
    totalPrice.value = (170 + toppingTotal) * quantity.value;
  }
}
