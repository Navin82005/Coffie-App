import 'package:coffieapp/controller/cart.controller.dart';
import 'package:coffieapp/model/beverages.model.dart';
import 'package:coffieapp/view/common/rating_widget.common.dart';
import 'package:coffieapp/view/home/components/item_card.home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalSection extends StatelessWidget {
  final Beverage beverage;
  final CartController cartController;
  const NormalSection({
    super.key,
    required this.beverage,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    // return GetX(
    // builder: (controller) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              beverage.name,
              style: const TextStyle(
                color: Color(0xFFCDCDCD),
                fontFamily: "Inter",
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RatingWidget(
                  fontSize: 12,
                  rating: beverage.rating,
                  color: Colors.black,
                ),
                if (beverage.isVeg) const SizedBox(width: 15),
                // if (beverage.isVeg) Image.asset("assets/vectors/veg_icon.png")
                if (beverage.isVeg)
                  Image.asset(
                    "assets/vectors/veg_icon.png",
                    height: 12,
                    width: 12,
                  ),
              ],
            ),
            SizedBox(
              width: 170,
              child: Text(
                beverage.description,
                textWidthBasis: TextWidthBasis.parent,
                softWrap: true,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 10,
                  color: Color(
                    0xFFC0C0C0,
                  ),
                ),
              ),
            )
          ],
        ),
        // Image.asset(beverage.imagePath, height: 120, width: 120),
        CoffeeCard(
          beverage: beverage,
          height: 120,
          width: 120,
          cartController: cartController,
        )
      ],
    );

    // },
    // );
  }
}
