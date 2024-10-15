import 'package:coffieapp/controller/nav.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
    );
  }
}
