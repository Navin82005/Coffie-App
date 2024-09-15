import 'package:coffieapp/model/beverages.model.dart';
import 'package:coffieapp/view/common/rating_widget.common.dart';
import 'package:coffieapp/view/product/components/choice_of_filling.product.dart';
import 'package:coffieapp/view/product/components/choice_of_milk.product.dart';
import 'package:coffieapp/view/product/components/choice_of_sugar.product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class RenderProductContents extends StatelessWidget {
  final Beverage beverage;

  const RenderProductContents(this.beverage, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            beverage.imagePath,
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              // mainAxisSize: MainAxisSize.min,
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          beverage.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            color: Color(0xFFCDCDCD),
                          ),
                        ),
                        const SizedBox(height: 12),
                        RatingWidget(
                          rating: beverage.rating,
                          color: const Color(0xFFCDCDCD),
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  beverage.description,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xFFCDCDCD),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Choice of Cup Filling",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xFFCDCDCD),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                ChoiceOfFilling(beverage: beverage),
                const SizedBox(height: 16),
                const Text(
                  "Choice of Milk",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xFFCDCDCD),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                const ChoiceOfMilkSection(),
                const SizedBox(height: 16),
                const Text(
                  "Choice of Sugar",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Color(0xFFCDCDCD),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                const ChoiceOfSugarSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
