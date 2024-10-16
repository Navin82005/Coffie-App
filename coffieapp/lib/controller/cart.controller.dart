import 'package:get/get.dart';

import 'package:coffieapp/model/beverages.model.dart';

class CartController extends GetxController {
  var cart = <Beverage>[].obs;
  var isLoading = false.obs;

  addToCart(Beverage beverage) {
    isLoading.value = true;
    cart.add(beverage);
    isLoading.value = false;
  }

  removeFromCart(id) {
    isLoading.value = true;
    for (var beverage in cart) {
      if (beverage.id == id) {
        cart.remove(beverage);
      }
    }
    isLoading.value = false;
  }
}
