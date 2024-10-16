import 'package:flutter/material.dart';

import 'package:coffieapp/model/beverages.model.dart';

import 'package:coffieapp/view/common/custom_appbar.dart';
import 'package:coffieapp/view/product/components/product_contents.product.dart';

class ProductPage extends StatelessWidget {
  final Beverage beverage;
  const ProductPage(this.beverage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.build(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/coffee_beans_bg.jpg",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          RenderProductContents(beverage),
        ],
      ),
    );
  }
}
