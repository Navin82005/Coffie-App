import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/beverage.controller.dart';
import 'package:coffieapp/controller/cart.controller.dart';
import 'package:coffieapp/controller/nav.controller.dart';
import 'package:coffieapp/controller/userdata.controller.dart';

import 'package:coffieapp/view/common/bottom_nav.dart';
import 'package:coffieapp/view/common/custom_appbar.dart';
import 'package:coffieapp/view/common/background_image.dart';
import 'package:coffieapp/view/common/glass_morphic_container.common.dart';
import 'package:coffieapp/view/home/components/header.home.dart';
import 'package:coffieapp/view/home/components/normal.home.dart';
import 'package:coffieapp/view/home/components/popular.home.dart';
import 'package:coffieapp/view/product/product.view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Initializing the controllers
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar.build(),
        body: Stack(
          children: [
            const BackgroundImage(),
            Positioned.fill(
              child: GlassMorphicContainer(
                imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                borderRadius: 0,
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  shrinkWrap: true,
                  children: [
                    const HeaderWidget(),
                    const PopularSection(),
                    _buildBeverageList(),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
            const BottomNavBar(),
          ],
        ),
      ),
    );
  }

  // Widget to build the beverage list using GetX
  Widget _buildBeverageList() {
    return GetX<BeverageController>(
      builder: (controller) {
        if (controller.isLoading.value) {
          return _buildLoadingList(controller);
        }

        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.beverageData.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildGetItInstantlyText();
            }

            return _buildBeverageItem(controller, index - 1);
          },
        );
      },
    );
  }

  // Widget to show 'Get it instantly' text
  Widget _buildGetItInstantlyText() {
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
  }

  // Widget to build each beverage item
  Widget _buildBeverageItem(BeverageController controller, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: GestureDetector(
        onTap: () => Get.to(() => ProductPage(controller.beverageData[index])),
        child: GlassMorphicContainer(
          imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          height: 180,
          borderRadius: 14,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: NormalSection(
              beverage: controller.beverageData[index],
              cartController: cartController,
            ),
          ),
        ),
      ),
    );
  }

  // Widget to show loading list while fetching data
  Widget _buildLoadingList(BeverageController controller) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.beverageData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: GlassMorphicContainer(
            imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            height: 160,
            borderRadius: 14,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            ),
          ),
        );
      },
    );
  }
}
