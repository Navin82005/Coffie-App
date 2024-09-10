import 'package:coffieapp/model/beverages.model.dart';
import 'package:get/get.dart';

class PopularController extends GetxController {
  var popularData = [
    Beverage(
      name: "",
      description: "",
      imagePath: "",
      isVeg: false,
      oneLiner: "",
      rating: "",
      id: 0,
    ),
    Beverage(
      id: 0,
      name: "",
      description: "",
      imagePath: "",
      isVeg: false,
      oneLiner: "",
      rating: "",
    )
  ].obs;

  var isLoading = false.obs;

  fetchData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    popularData.value = [
      Beverage(
        id: 1,
        name: "Hot Cappuccino",
        description: "",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/cappuccino_1.png",
        isVeg: true,
      ),
      Beverage(
        id: 2,
        name: "Hot Cappuccino",
        description: "",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/cappuccino_2.png",
        isVeg: true,
      ),
      Beverage(
        id: 3,
        name: "Hot Cappuccino",
        description: "",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/cappuccino_3.png",
        isVeg: true,
      ),
    ];
    isLoading.value = false;
  }
}
