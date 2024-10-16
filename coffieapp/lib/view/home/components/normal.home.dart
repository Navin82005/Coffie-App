import 'package:flutter/material.dart';

import 'package:coffieapp/controller/cart.controller.dart';

import 'package:coffieapp/model/beverages.model.dart';

import 'package:coffieapp/view/common/rating_widget.common.dart';
import 'package:coffieapp/view/home/components/item_card.home.dart';

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
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBeverageDetails(),
        _buildBeverageCard(),
      ],
    );
  }

  // Method to build the beverage details section
  Widget _buildBeverageDetails() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBeverageName(),
        const SizedBox(height: 6),
        _buildRatingAndVegIcon(),
        _buildBeverageDescription(),
      ],
    );
  }

  // Widget for the beverage name text
  Widget _buildBeverageName() {
    return Text(
      beverage.name,
      style: const TextStyle(
        color: Color(0xFFCDCDCD),
        fontFamily: "Inter",
        fontSize: 18,
      ),
    );
  }

  // Widget to display rating and veg icon
  Widget _buildRatingAndVegIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingWidget(
          fontSize: 12,
          rating: beverage.rating,
          color: Colors.black,
        ),
        if (beverage.isVeg) const SizedBox(width: 15),
        if (beverage.isVeg) _buildVegIcon(),
      ],
    );
  }

  // Widget to display the veg icon
  Widget _buildVegIcon() {
    return Image.asset(
      "assets/vectors/veg_icon.png",
      height: 12,
      width: 12,
    );
  }

  // Widget for the beverage description
  Widget _buildBeverageDescription() {
    return SizedBox(
      width: 170,
      child: Text(
        beverage.description,
        textWidthBasis: TextWidthBasis.parent,
        softWrap: true,
        style: const TextStyle(
          fontFamily: "Inter",
          fontSize: 10,
          color: Color(0xFFC0C0C0),
        ),
      ),
    );
  }

  // Widget to display the beverage card
  Widget _buildBeverageCard() {
    return CoffeeCard(
      beverage: beverage,
      height: 120,
      width: 120,
      cartController: cartController,
    );
  }
}
