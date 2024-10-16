import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/beverage.controller.dart';

import 'package:coffieapp/model/beverages.model.dart';

import 'package:coffieapp/view/product/components/switch_.product.dart';

class ChoiceOfSugarSection extends StatefulWidget {
  const ChoiceOfSugarSection({super.key});

  @override
  State<ChoiceOfSugarSection> createState() => _ChoiceOfSugarSectionState();
}

class _ChoiceOfSugarSectionState extends State<ChoiceOfSugarSection> {
  var beverageController = Get.put(BeverageMilkController());
  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  String convertEnumToString(ChoiceOfSugar sugar) {
    // Regular expression to find camel case pattern
    final camelCasePattern = RegExp(r'(?<=[a-z])[A-Z]');

    // Add space before each uppercase letter and then split words
    String formattedString = sugar.name
        .replaceAllMapped(camelCasePattern, (match) => ' ${match.group(0)}');

    // Capitalize the first letter of each word
    String capitalized = formattedString
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');

    return capitalized;
  }

  void initializeValues() {}

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 4 / 1,
      children: ((ChoiceOfSugar.values).map((sugar) => ChoiceSwitch(
            text: choiceOfSugarMap[sugar]!,
            controller: Get.find<BeverageController>(),
          ))).toList(),
    );
  }
}
