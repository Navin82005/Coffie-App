import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffieapp/controller/popular.controller.dart';
import 'package:coffieapp/core/conf/app_config.dart';

import 'package:coffieapp/view/common/adder.dart';
import 'package:coffieapp/view/common/glass_morphic_container.common.dart';
import 'package:coffieapp/view/common/rating_widget.common.dart';

class PopularSection extends StatefulWidget {
  const PopularSection({super.key});

  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {
  final popularController = Get.put(PopularController());

  @override
  void initState() {
    super.initState();
    popularController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color(0xFF313131).withOpacity(.45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: GetX<PopularController>(builder: (controller) {
          return ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.popularData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: _buildGlassMorphicCard(controller, index),
              );
            },
          );
        }),
      ),
    );
  }

  // Method to build the glass morphic container card
  Widget _buildGlassMorphicCard(PopularController controller, int index) {
    return GlassMorphicContainer(
      borderRadius: 5,
      imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      height: 270,
      width: 220,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImageOrLoader(controller, index),
              if (!controller.isLoading.value)
                ..._buildContent(controller, index),
            ],
          ),
        ),
      ),
    );
  }

  // Method to display either the beverage image or a loader
  Widget _buildImageOrLoader(PopularController controller, int index) {
    return controller.popularData[index].imagePath.isNotEmpty
        ? Center(
            child: Image.asset(
              controller.popularData[index].imagePath,
              height: 125,
              width: 125,
            ),
          )
        : const Center(
            child: SizedBox(
              height: 125,
              width: 125,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          );
  }

  // Method to build the content section inside the card
  List<Widget> _buildContent(PopularController controller, int index) {
    return [
      _buildTitle(controller.popularData[index].name),
      const SizedBox(height: 6),
      _buildRatingAndAdder(controller, index),
    ];
  }

  // Widget to display the title
  Widget _buildTitle(String name) {
    return AppTypography.Heading1(
      text: name,
      fontWeight: FontWeight.w500,
    );
  }

  // Widget to display rating and the adder button
  Widget _buildRatingAndAdder(PopularController controller, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTypography.body2(
              text: controller.popularData[index].name,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 6),
            RatingWidget(
              rating: controller.popularData[index].rating,
              fontSize: 12,
              color: Colors.black,
            ),
          ],
        ),
        const Adder(),
      ],
    );
  }
}
