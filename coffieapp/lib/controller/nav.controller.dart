import 'package:coffieapp/controller/cart.controller.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  CartController cartController = Get.find<CartController>();
}
