import 'dart:ui';

import 'package:coffieapp/core/conf/app_config.dart';
import 'package:coffieapp/model/beverages.model.dart';
import 'package:coffieapp/view/common/glass_morphic_container.common.dart';
import 'package:coffieapp/view/common/rating_widget.common.dart';
import 'package:coffieapp/view/product/components/choice_of_filling.product.dart';
import 'package:coffieapp/view/product/components/choice_of_milk.product.dart';
import 'package:coffieapp/view/product/components/choice_of_sugar.product.dart';
import 'package:coffieapp/view/product/components/submit.product.dart';
import 'package:flutter/material.dart';

class RenderProductContents extends StatelessWidget {
  final Beverage beverage;

  const RenderProductContents(this.beverage, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        Image.asset(
          beverage.imagePath,
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            // shrinkWrap: true,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTypography.Heading1(text: beverage.name),
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
              AppTypography.body2(text: beverage.description),
              const SizedBox(height: 16),
              AppTypography.Heading2(text: "Choice of Cup Filling"),
              const SizedBox(height: 16),
              ChoiceOfFilling(beverage: beverage),
              const SizedBox(height: 16),
              AppTypography.Heading2(text: "Choice of Milk"),
              const SizedBox(height: 16),
              const ChoiceOfMilkSection(),
              const SizedBox(height: 16),
              AppTypography.Heading2(text: "Choice of Sugar"),
              const SizedBox(height: 16),
              const ChoiceOfSugarSection(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          child: GlassMorphicContainer(
            height: 90,
            imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            borderRadius: 15,
            child: const SubmitProduct(),
          ),
        ),
      ],
    );
  }
}
