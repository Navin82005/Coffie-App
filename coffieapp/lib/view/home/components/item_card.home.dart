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
    return SizedBox(
      height: height + 20,
      width: width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(beverage.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 30,
                // width: 50,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    cartController.addToCart(beverage);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
