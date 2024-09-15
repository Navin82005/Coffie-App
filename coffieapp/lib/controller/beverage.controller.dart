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
    ),
    Beverage(
      name: "",
      oneLiner: "",
      description: "",
      imagePath: "",
      rating: "",
      isVeg: true,
    ),
    Beverage(
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
        name: "Lattè",
        description:
            "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/latte.png",
        isVeg: true,
      ),
      Beverage(
        name: "Flat White",
        description:
            "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.7|458",
        imagePath: "assets/images/cappuccino_1.png",
        isVeg: true,
      ),
      Beverage(
        name: "Hot Cappuccino",
        description: "",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/cappuccino_1.png",
        isVeg: true,
      ),
      Beverage(
        name: "Hot Cappuccino",
        description: "",
        oneLiner: "Espresso, Steamed Milk",
        rating: "4.9|458",
        imagePath: "assets/images/cappuccino_2.png",
        isVeg: true,
      ),
      Beverage(
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

  void updateBeverageData(String id, ChoiceOfCupFilling cup) {
    int index = beverageData.indexWhere((b) => b.id == id);
    if (index != -1) {
      beverageData[index].choiceOfCupFilling = cup;
      update();
    }
  }

  void updateBeverageDataMilk(String id, ChoiceOfMilk milk) {
    int index = beverageData.indexWhere((b) => b.id == id);
    if (index != -1) {
      beverageData[index].choiceOfMilk = milk;
      update();
    }
  }

  void updateBeverageDataSugar(String id, ChoiceOfSugar sugar) {
    int index = beverageData.indexWhere((b) => b.id == id);
    if (index != -1) {
      beverageData[index].choiceOfSugar = sugar;
      update();
    }
  }
}

class BeverageFillingController extends GetxController {
  var currentCup = ChoiceOfCupFilling.full.obs;

  updateCurrentCup(ChoiceOfCupFilling cup, Beverage beverage) {
    currentCup.value = cup;
    Get.find<BeverageController>().updateBeverageData(beverage.id, cup);
  }
}

class BeverageMilkController extends GetxController {
  var selectedMilk = ChoiceOfMilk.fullCreamMilk.obs;

  updateCurrentCup(ChoiceOfMilk milk, Beverage beverage) {
    selectedMilk.value = milk;
    Get.find<BeverageController>().updateBeverageDataMilk(beverage.id, milk);
  }
}

class BeverageSugarController extends GetxController {
  var selectedSugar = ChoiceOfSugar.once.obs;

  updateCurrentCup(ChoiceOfSugar sugar, Beverage beverage) {
    selectedSugar.value = sugar;
    Get.find<BeverageController>().updateBeverageDataSugar(beverage.id, sugar);
  }
}
