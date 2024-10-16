import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/beverage.controller.dart';

import 'package:coffieapp/model/beverages.model.dart';

import 'package:coffieapp/view/product/components/switch_.product.dart';

class ChoiceOfMilkSection extends StatefulWidget {
  const ChoiceOfMilkSection({super.key});

  @override
  State<ChoiceOfMilkSection> createState() => _ChoiceOfMilkSectionState();
}

class _ChoiceOfMilkSectionState extends State<ChoiceOfMilkSection> {
  var beverageController = Get.put(BeverageMilkController());
  @override
  void initState() {
    super.initState();
    initializeValues();
  }

  String convertEnumToString(ChoiceOfMilk milk) {
    // Regular expression to find camel case pattern
    final camelCasePattern = RegExp(r'(?<=[a-z])[A-Z]');

    // Add space before each uppercase letter and then split words
    String formattedString = milk.name
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
      children: ((ChoiceOfMilk.values).map(
        (milk) => ChoiceSwitch(
          text: convertEnumToString(milk),
          controller: Get.find<BeverageController>(),
        ),
      )).toList(),
    );
  }
}
