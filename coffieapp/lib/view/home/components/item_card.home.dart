import 'package:coffieapp/controller/cart.controller.dart';
import 'package:coffieapp/model/beverages.model.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  final Beverage beverage;
  final double width;
  final double height;
  final CartController cartController;
  const CoffeeCard({
    super.key,
    required this.beverage,
    required this.width,
    required this.height,
    required this.cartController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(beverage.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 2,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                print(cartController.cart.toString());
                cartController.addToCart(beverage);
              },
              child: const Text(
                "ADD",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
