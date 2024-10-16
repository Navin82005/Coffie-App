import 'package:get/get.dart';

import 'package:coffieapp/controller/cart.controller.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  CartController cartController = Get.find<CartController>();
}
