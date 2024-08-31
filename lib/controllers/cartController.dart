import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = {}.obs; // Stores items with their quantities
  var totalPrice = 0.0.obs;

  // Define a price map for items
  Map<String, int> priceMap = {
    "Bacon Burger King": 150,
    "Chipotle Mayo": 20,
    "Hot Sauce": 25,
    "Truffle Mayo": 15,
    "Signature Sauce": 25,
  };

  void addItem(String itemName, int price) {
    if (cartItems.containsKey(itemName)) {
      cartItems[itemName] += 1;
    } else {
      cartItems[itemName] = 1;
    }
    calculateTotal();
  }

  void removeItem(String itemName) {
    if (cartItems.containsKey(itemName)) {
      if (cartItems[itemName] == 1) {
        cartItems.remove(itemName);
      } else {
        cartItems[itemName] -= 1;
      }
      calculateTotal();
    }
  }

  void calculateTotal() {
    var total = 0.0;
    cartItems.forEach((item, quantity) {
      total += quantity * priceMap[item]!;
    });
    totalPrice.value = total;
  }
}
