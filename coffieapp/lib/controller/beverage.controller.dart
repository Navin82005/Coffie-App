import 'package:coffieapp/model/beverages.model.dart';
import 'package:get/get.dart';

class BeverageController extends GetxController {
  var isLoading = false.obs;
  var beverageData = [
    Beverage(
      name: "",
      oneLiner: "",
      description: "",
      imagePath: "",
      rating: "",
      isVeg: true,
      id: 0,
    ),
    Beverage(
      id: 0,
      name: "",
      oneLiner: "",
      description: "",
      imagePath: "",
      rating: "",
      isVeg: true,
    ),
    Beverage(
      id: 0,
      name: "",
      oneLiner: "",
      description: "",
      imagePath: "",
      rating: "",
      isVeg: true,
    ),
  ].obs;

  fetchBeverageData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    beverageData.value = [
      Beverage(
        id: 1,
        name: "Lattè",
        description:
            "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/latte.png",
        isVeg: true,
      ),
      Beverage(
        id: 2,
        name: "Flat White",
        description:
            "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.7|458",
        imagePath: "assets/images/cappuccino_1.png",
        isVeg: true,
      ),
      Beverage(
        id: 3,
        name: "Hot Cappuccino",
        description: "",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/cappuccino_1.png",
        isVeg: true,
      ),
      Beverage(
        id: 4,
        name: "Hot Cappuccino",
        description: "",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/cappuccino_2.png",
        isVeg: true,
      ),
      Beverage(
        id: 5,
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
