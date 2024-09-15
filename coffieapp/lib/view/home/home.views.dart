import 'dart:ui';
import 'package:coffieapp/controller/beverage.controller.dart';
import 'package:coffieapp/controller/cart.controller.dart';
import 'package:coffieapp/controller/nav.controller.dart';
import 'package:coffieapp/controller/userdata.controller.dart';
import 'package:coffieapp/model/beverages.model.dart';
import 'package:coffieapp/model/userdata.model.dart';
import 'package:coffieapp/view/common/background_image.dart';
import 'package:coffieapp/view/common/bottom_nav.dart';
import 'package:coffieapp/view/common/glass_morphic_container.common.dart';
import 'package:coffieapp/view/common/rating_widget.common.dart';
import 'package:coffieapp/view/common/search_bar.common.dart';
import 'package:coffieapp/view/home/components/header.home.dart';
import 'package:coffieapp/view/home/components/item_card.home.dart';
import 'package:coffieapp/view/home/components/normal.home.dart';
import 'package:coffieapp/view/home/components/popular.home.dart';
import 'package:coffieapp/view/home/components/welcome_widget.home.dart';
import 'package:coffieapp/view/product/components/switch_.product.dart';
import 'package:coffieapp/view/product/product.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userDataController = Get.put(UserDataController());
  final beverageController = Get.put(BeverageController());
  final cartController = Get.put(CartController());
  final navController = Get.put(BottomNavController());

  @override
  void initState() {
    super.initState();
    userDataController.fetchUserData();
    beverageController.fetchBeverageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      body: Stack(
        children: [
          const BackgroundImage(),
          Positioned.fill(
            child: GlassMorphicContainer(
              imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              borderRadius: 0,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const HeaderWidget(),
                  const PopularSection(),
                  GetX<BeverageController>(
                    builder: (controller) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.beverageData.length,
                        itemBuilder: (context, index) {
                          if (controller.isLoading.value) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                              child: GlassMorphicContainer(
                                imageFilter:
                                    ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                height: 160,
                                borderRadius: 14,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            );
                          }
                          if (index == 0) {
                            return const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 20, left: 20),
                                child: Text(
                                  "Get it instantly",
                                  style: TextStyle(
                                    color: Color(0xFFB6B6B6),
                                    fontFamily: "Inter",
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 14,
                              ),
                              child: GestureDetector(
                                onTap: () => Get.to(ProductPage(
                                  controller.beverageData[index - 1],
                                )),
                                child: GlassMorphicContainer(
                                  imageFilter:
                                      ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                  height: 180,
                                  borderRadius: 14,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20,
                                        bottom: 20,
                                        left: 24,
                                        right: 14),
                                    child: NormalSection(
                                      beverage:
                                          controller.beverageData[index - 1],
                                      cartController: cartController,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 50)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GetX<BottomNavController>(builder: (controller) {
              return BottomNavigationBar(
                elevation: 0,
                backgroundColor: const Color(0x00000000),
                currentIndex: controller.currentIndex.value,
                showSelectedLabels: false,
                iconSize: 20,
                onTap: (value) => controller.currentIndex.value = value,
                items: [
                  const BottomNavigationBarItem(
                    backgroundColor: Color.fromARGB(150, 0, 0, 0),
                    label: "home",
                    activeIcon: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.white,
                    ),
                  ),
                  const BottomNavigationBarItem(
                    label: "profile",
                    icon: Icon(Icons.account_circle_outlined),
                    activeIcon: Icon(Icons.account_circle),
                  ),
                  const BottomNavigationBarItem(
                    label: "wallet",
                    icon: Icon(Icons.account_balance_wallet_outlined),
                    activeIcon: Icon(Icons.account_balance_wallet),
                  ),
                  BottomNavigationBarItem(
                    label: "cart",
                    icon: controller.cartController.cart.isEmpty
                        ? const Icon(CupertinoIcons.cart)
                        : const Icon(CupertinoIcons.cart_badge_plus),
                    activeIcon: const Icon(CupertinoIcons.cart_fill),
                  ),
                  const BottomNavigationBarItem(
                    label: "notification",
                    icon: Icon(Icons.messenger_outline),
                    activeIcon: Icon(Icons.messenger_outlined),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
