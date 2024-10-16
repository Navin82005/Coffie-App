import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/beverage.controller.dart';

import 'package:coffieapp/model/beverages.model.dart';

class ChoiceOfFilling extends StatelessWidget {
  final Beverage beverage;
  const ChoiceOfFilling({super.key, required this.beverage});

  @override
  Widget build(BuildContext context) {
    Get.put(BeverageFillingController());
    return GetX<BeverageFillingController>(builder: (controller) {
      List<Widget> boxes = [];
      for (var cup in ChoiceOfCupFilling.values) {
        boxes.add(
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: controller.currentCup.value == cup
                  ? const Color(0xFF37AD54)
                  : const Color(0xFFD9D9D9),
            ),
            child: GestureDetector(
              onTap: () {
                controller.updateCurrentCup(cup, beverage);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Text(
                  choiceOfCupFillingMap[cup].toString(),
                  style: const TextStyle(fontFamily: "Inter", fontSize: 12),
                ),
              ),
            ),
          ),
        );
      }

      return Row(children: boxes);
    });
  }
}
