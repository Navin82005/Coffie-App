import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/nav.controller.dart';
import 'package:coffieapp/view/common/glass_morphic_container.common.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              color: Colors.black.withOpacity(.25),
              blurRadius: 4,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(51, 51, 51, .84),
        ),
        width: Get.width,
        height: 80,
        child: GlassMorphicContainer(
          borderRadius: 15,
          backgroundColor: Colors.transparent,
          imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BarItemImage(path: "assets/icons/home.png", index: 0),
                BarItemImage(path: "assets/icons/person.png", index: 1),
                BarItemImage(path: "assets/icons/wallet.png", index: 2),
                BarItemImage(path: "assets/icons/basket.png", index: 3),
                BarItemImage(path: "assets/icons/chat.png", index: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BarItemImage extends StatelessWidget {
  final String path;
  final int index;
  const BarItemImage({super.key, required this.path, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetX<BottomNavController>(
      builder: (controller) => GestureDetector(
        onTap: () => controller.currentIndex.value = index,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: controller.currentIndex.value == index
                ? const Color(0xFF2D2D2D)
                : Colors.transparent,
            border: controller.currentIndex.value == index
                ? Border.all(color: const Color(0xFF5E5E5E))
                : Border.all(color: Colors.transparent),
            boxShadow: controller.currentIndex.value == index
                ? [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      color: Colors.white.withOpacity(.25),
                      spreadRadius: -2,
                      blurRadius: 4,
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            child: Image.asset(path, height: 20, width: 20),
          ),
        ),
      ),
    );
  }
}
