import 'package:coffieapp/controller/userdata.controller.dart';
import 'package:coffieapp/view/common/search_bar.common.dart';
import 'package:coffieapp/view/home/components/welcome_widget.home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<UserDataController>(builder: (controller) {
        print(controller.userData.value.date);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              WelcomeWidget(
                date: controller.userData.value.date,
                username: controller.userData.value.username,
              ),
              const SizedBox(height: 35),
              UiSearchBar(
                borderRadius: BorderRadius.circular(8),
                hintColor: const Color(0xFFBBBBBC),
                color: const Color(0xFFBBBBBC),
                hintText: "Search favorite Beverages",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune, color: Color(0xFFBBBBBC)),
                  onPressed: () => print("Pressed filter"),
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFFBBBBBC)),
              ),
            ],
          ),
        );
      }),
    );
  }
}
