import 'package:coffieapp/model/beverages.model.dart';
import 'package:coffieapp/view/home/components/header.home.dart';
import 'package:coffieapp/view/product/components/product_contents.product.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Beverage beverage;
  const ProductPage(this.beverage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/coffeebeans_bg.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Expanded(child: RenderProductContents(beverage)),
            ],
          ),
          const HeaderWidget(),
        ],
      ),
    );
  }
}
